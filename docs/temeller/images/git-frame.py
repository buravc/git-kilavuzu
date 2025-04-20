from manim import *

class Commit():
    circle: Circle
    message: Paragraph
    parent: 'Commit'
    arrow: Arrow
    def __init__(self, msg: str, pos: Vector, parent: 'Commit' = None):
        self.circle = Circle().move_to(pos)
        self.message = Paragraph(msg, alignment="center").move_to(self.circle.get_center())
        self.message.color = BLACK
        self.message.scale_to_fit_width(self.circle.width*0.9)
        self.parent = parent
        if parent is not None:
             # Compute the direction vector from circle1 to circle2
            direction = parent.circle.get_center() - self.circle.get_center()
            unit_direction = direction / np.linalg.norm(direction)

            # Compute start and end points on the outer edges
            start_point = self.circle.get_center() + unit_direction * self.circle.radius
            end_point = parent.circle.get_center() - unit_direction * parent.circle.radius

            # Create the arrow between the edge points
            self.arrow = Arrow(start=start_point, end=end_point, color=BLACK)
    def add_to_scene(self, scene: Scene):
        scene.add(self.circle, self.message)
        if self.parent is not None:
            scene.add(self.arrow)
    def animate(self, scene: Scene):
        scene.play(Create(self.circle), Create(self.message))
        if self.parent is not None:
            scene.play(Create(self.arrow))



class GitCommitDiagram(Scene):
    def construct(self):
        self.camera.background_color = WHITE
        commit1 = Commit("Ilk commit", LEFT*5)
        commit2 = Commit("Dosyaya Merhaba\nDunya ekledim", 0, commit1)
        commit3 = Commit("yeni-branch icin\nilk commitimi atiyorum", RIGHT*5, commit2)
        
        gitInitCommitText = self.create_shell_command_prompt("git commit -m \"Ilk commit\"")
        gitFixBugCommitText = self.create_shell_command_prompt("git commit -m \"Dosyaya Merhaba\nDunya ekledim\"")
        gitAddNewFeatureCommitText = self.create_shell_command_prompt("git commit -m \"yeni-branch icin\nilk commitimi atiyorum\"")
        
        self.spawn_commit(commit1, None, gitInitCommitText)

        self.wait(3)

        self.spawn_commit(commit2, gitInitCommitText, gitFixBugCommitText)

        self.wait(3)

        self.spawn_commit(commit3, gitFixBugCommitText, gitAddNewFeatureCommitText)
        
        self.wait(3)

    def spawn_commit(self, commit: Commit, prevPrompt: Paragraph, newPrompt: Paragraph):
        if prevPrompt is not None:
            self.remove(prevPrompt)
        
        self.play(Create(newPrompt))
        commit.animate(self)
        
    
    def create_shell_command_prompt(self, msg: str):
        text = Paragraph("$ " + msg, alignment="center").scale_to_fit_width(6).move_to(UP*2)
        text.color = BLACK
        return text

