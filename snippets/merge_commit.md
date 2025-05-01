# --8<-- [start:git-commit-main]
```bash 
$ git checkout main
Switched to branch 'main'

$ echo "Lorem ipsum" > test-2.txt

$ git add test-2.txt

$ git commit -m "test-2.txt dosyasini ekledim"
[main f901136] test-2.txt dosyasini ekledim
 1 file changed, 1 insertion(+)
 create mode 100644 test-2.txt

$ git show f901136
commit f901136ee0251c06870d6a5c1f0f12218075fade (HEAD -> main)
Author: <username> <email>
Date:   Thu May 1 17:11:45 2025 +0200

    test-2.txt dosyasini ekledim

diff --git a/test-2.txt b/test-2.txt
new file mode 100644
index 0000000..3be11c6
--- /dev/null
+++ b/test-2.txt
@@ -0,0 +1 @@
+Lorem ipsum
```
# --8<-- [end:git-commit-main]
# --8<-- [start:git-log-1]
```bash hl_lines="5"
$ git log --graph --parents --oneline --all
* f901136 cc91c99 (HEAD -> main) test-2.txt dosyasini ekledim
| * 1a45c93 cc91c99 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
|/  
* cc91c99 3ef71ec Dosyaya Merhaba Dunya ekledim
* 3ef71ec Ilk commit
```
# --8<-- [end:git-log-1]
# --8<-- [start:git-merge-yeni-branch]
```bash 
$ git merge yeni-branch
Merge made by the 'ort' strategy.
 test.txt | 1 +
 1 file changed, 1 insertion(+)
```
# --8<-- [end:git-merge-yeni-branch]
# --8<-- [start:git-log-2]
```bash 
$ git log --graph --parents --oneline --all
*   8df38ff f901136 1a45c93 (HEAD -> main) Merge branch 'yeni-branch'
|\  
| * 1a45c93 cc91c99 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | f901136 cc91c99 test-2.txt dosyasini ekledim
|/  
* cc91c99 3ef71ec Dosyaya Merhaba Dunya ekledim
* 3ef71ec Ilk commit
```
# --8<-- [end:git-log-2]
# --8<-- [start:git-show]
```bash hl_lines="3"
$ git show 8df38ff
commit 8df38ff54f67c6a4a4acb57ed467720f9bf3b60f (HEAD -> main)
Merge: f901136 1a45c93
Author: <username> <email>
Date:   Thu May 1 17:11:46 2025 +0200

    Merge branch 'yeni-branch'

```
# --8<-- [end:git-show]
