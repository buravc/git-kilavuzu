# --8<-- [start:git-commit-main]
```bash 
$ git checkout main
Switched to branch 'main'

$ echo "Lorem ipsum" > test-2.txt

$ git add test-2.txt

$ git commit -m "test-2.txt dosyasini ekledim"
[main bdb78d0] test-2.txt dosyasini ekledim
 1 file changed, 1 insertion(+)
 create mode 100644 test-2.txt

$ git show bdb78d0
commit bdb78d05b9bd4094170b438fa904d62a49585bf6 (HEAD -> main)
Author: <username> <email>
Date:   Thu May 1 19:30:19 2025 +0200

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
* bdb78d0 be76ce7 (HEAD -> main) test-2.txt dosyasini ekledim
| * 3be1429 be76ce7 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
|/  
* be76ce7 0831d6c Dosyaya Merhaba Dunya ekledim
* 0831d6c Ilk commit
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
*   a3cf991 bdb78d0 3be1429 (HEAD -> main) Merge branch 'yeni-branch'
|\  
| * 3be1429 be76ce7 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | bdb78d0 be76ce7 test-2.txt dosyasini ekledim
|/  
* be76ce7 0831d6c Dosyaya Merhaba Dunya ekledim
* 0831d6c Ilk commit
```
# --8<-- [end:git-log-2]
# --8<-- [start:git-show]
```bash hl_lines="3"
$ git show a3cf991
commit a3cf991913353d2a06ddc15db7de2eafd96d4441 (HEAD -> main)
Merge: bdb78d0 3be1429
Author: <username> <email>
Date:   Thu May 1 19:30:20 2025 +0200

    Merge branch 'yeni-branch'

```
# --8<-- [end:git-show]
