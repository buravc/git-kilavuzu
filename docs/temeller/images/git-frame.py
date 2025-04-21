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
    def animate(self, scene: Scene, *otherObjects: Mobject | Animation):
        scene.play(Create(self.circle), Create(self.message), otherObjects)
        if self.parent is not None:
            scene.play(Create(self.arrow))

class Ref():
    commit: Commit = None
    arrow: Arrow
    text: Text
    branchName: str
    def __init__(self, branchName: str):
        self.branchName = branchName
    def get_animated_commit_change(self, commit: Commit, scene: Scene):
        if self.commit is None:
            self.commit = commit
            start_point=[commit.circle.get_center()[0], -3,0]
            direction=commit.circle.get_center() - start_point
            unit_direction = direction / np.linalg.norm(direction)
            end_point = commit.circle.get_center() - unit_direction * commit.circle.radius
            self.text = Text(self.branchName,color=BLACK,font_size=25).move_to([start_point[0], start_point[1], 0])
            self.arrow = Arrow(start=start_point, end=end_point, color=BLACK)
            return Create(self.arrow), Create(self.text)
        else:
            self.commit = commit
            start_point=[commit.circle.get_center()[0], self.arrow.get_center()[1],0]
            return self.arrow.animate.move_to(start_point), self.text.animate.move_to([start_point[0], self.text.get_center()[1], 0])


class GitCommitDiagram(Scene):
    def construct(self):
        self.camera.background_color = WHITE
        commitMessages=["Ilk commit", "Dosyaya Merhaba\nDunya ekledim", "yeni-branch icin\nilk commitimi atiyorum"]
        commit1 = Commit(commitMessages[0], LEFT*5)
        commit2 = Commit(commitMessages[1], 0, commit1)
        commit3 = Commit(commitMessages[2], RIGHT*5, commit2)
        
        gitInitCommitText = self.create_shell_command_prompt(f"git commit -m \"{commitMessages[0]}\"")
        gitFixBugCommitText = self.create_shell_command_prompt(f"git commit -m \"{commitMessages[1]}\"")
        gitAddNewFeatureCommitText = self.create_shell_command_prompt(f"git checkout -b yeni-branch\n$ git commit -m \"{commitMessages[2]}\"")

        mainBranchPointer = Ref("main")
        
        self.spawn_commit(commit1, None, gitInitCommitText, mainBranchPointer)

        self.wait(2)

        self.spawn_commit(commit2, gitInitCommitText, gitFixBugCommitText, mainBranchPointer)

        self.wait(2)

        yeniBranchPointer = Ref("yeni-branch")

        self.spawn_commit(commit3, gitFixBugCommitText, gitAddNewFeatureCommitText, yeniBranchPointer)
        
        self.wait(2)

    def spawn_commit(self, commit: Commit, prevPrompt: Paragraph, newPrompt: Paragraph, branchRef: Ref):
        if prevPrompt is not None:
            self.remove(prevPrompt)
        
        self.play(Create(newPrompt))
        commit.animate(self, *branchRef.get_animated_commit_change(commit, self))
    
    def create_shell_command_prompt(self, msg: str):
        text = Paragraph("$ " + msg, alignment="center").scale_to_fit_width(6).move_to(UP*2)
        text.color = BLACK
        return text

