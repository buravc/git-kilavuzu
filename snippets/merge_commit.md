# --8<-- [start:git-commit-main]
```bash 
$ git checkout main
Switched to branch 'main'

$ echo "Lorem ipsum" > test-2.txt

$ git add test-2.txt

$ git commit -m "test-2.txt dosyasini ekledim"
[main 9a63d64] test-2.txt dosyasini ekledim
 1 file changed, 1 insertion(+)
 create mode 100644 test-2.txt

$ git show 9a63d64
commit 9a63d6499f568868f73613412f881a770f33342d (HEAD -> main)
Author: <username> <email>
Date:   Fri May 2 21:49:15 2025 +0200

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
* 9a63d64 777f68a (HEAD -> main) test-2.txt dosyasini ekledim
| * dc2243f 777f68a (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
|/  
* 777f68a 95e7356 Dosyaya Merhaba Dunya ekledim
* 95e7356 Ilk commit
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
*   b5b6c09 9a63d64 dc2243f (HEAD -> main) Merge branch 'yeni-branch'
|\  
| * dc2243f 777f68a (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | 9a63d64 777f68a test-2.txt dosyasini ekledim
|/  
* 777f68a 95e7356 Dosyaya Merhaba Dunya ekledim
* 95e7356 Ilk commit
```
# --8<-- [end:git-log-2]
# --8<-- [start:git-show]
```bash hl_lines="3"
$ git show b5b6c09
commit b5b6c0910ab195204dec707b3370b8e70b47eabc (HEAD -> main)
Merge: 9a63d64 dc2243f
Author: <username> <email>
Date:   Fri May 2 21:49:17 2025 +0200

    Merge branch 'yeni-branch'

```
# --8<-- [end:git-show]
