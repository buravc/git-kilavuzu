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
    def get_animated_commit_change(self, commit: Commit):
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
    def get_animated_commit_change_fadeout(self, commit: Commit):
        self.commit = commit
        start_point=[commit.circle.get_center()[0], self.arrow.get_center()[1],0]
        return FadeOut(self.arrow, target_position=start_point), FadeOut(self.text, target_position=[start_point[0], self.text.get_center()[1], 0])
    def set_ref_text(self, scene: Scene, text: str):
        old_text = self.text;
        old_center = old_text.get_center()
        start_point = [old_center[0], old_center[1]-0.2, 0]
        self.text = Text(text,color=BLACK,font_size=25).move_to(start_point)
        return FadeOut(old_text), FadeIn(self.text)

class GitFFMergeDiagram(Scene):
    def construct(self):
        self.camera.background_color = WHITE
        commitMessages=["commit 1", 
                        "commit 2", 
                        "commit 3"]
        commit1 = Commit(commitMessages[0], LEFT*5)
        commit2 = Commit(commitMessages[1], 0, commit1)
        commit3 = Commit(commitMessages[2], RIGHT*5, commit2)

        branchB = Ref("branch-B")
        
        gitInitCommitText = self.create_shell_command_prompt(f"git commit -m \"{commitMessages[0]}\"")
        gitFixBugCommitText = self.create_shell_command_prompt(f"git commit -m \"{commitMessages[1]}\"")
        gitAddNewFeatureCommitText = self.create_shell_command_prompt(f"git checkout -b branch-B\n$ git commit -m \"{commitMessages[2]}\"")
        gitMergeCommitText = self.create_shell_command_prompt("git merge branch-B")

        branchA = Ref("branch-A")
        
        self.spawn_commit(commit1, None, gitInitCommitText, branchA)

        self.spawn_commit(commit2, gitInitCommitText, gitFixBugCommitText, branchA)

        self.spawn_commit(commit3, gitFixBugCommitText, gitAddNewFeatureCommitText, branchB)

        self.run_ff_merge(gitAddNewFeatureCommitText, gitMergeCommitText, branchA, branchB)

        self.wait(2)



    def spawn_commit(self, commit: Commit, prevPrompt: Paragraph, newPrompt: Paragraph, branchRef: Ref):
        if prevPrompt is not None:
            self.remove(prevPrompt)
        
        self.play(Create(newPrompt))
        commit.animate(self, *branchRef.get_animated_commit_change(commit))

    def run_ff_merge(self, prevPrompt: Paragraph, newPrompt: Paragraph, intoBranch: Ref, targetBranch: Ref):
        if prevPrompt is not None:
            self.remove(prevPrompt)
        self.play(Create(newPrompt))
        commit = targetBranch.commit
        self.play(AnimationGroup(
            AnimationGroup(
                *intoBranch.get_animated_commit_change_fadeout(commit)),
                *targetBranch.set_ref_text(self,f"{intoBranch.branchName}\n{targetBranch.branchName}"),
                lag_ratio=0.1))
        
    
    def create_shell_command_prompt(self, msg: str):
        text = Paragraph("$ " + msg, alignment="center").scale_to_fit_width(6).move_to(UP*2)
        text.color = BLACK
        return text

