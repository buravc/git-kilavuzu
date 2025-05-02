# --8<-- [start:git-commit-main]
```bash 
$ git checkout main
Switched to branch 'main'

$ echo "Lorem ipsum" > test-2.txt

$ git add test-2.txt

$ git commit -m "test-2.txt dosyasini ekledim"
[main 5b86313] test-2.txt dosyasini ekledim
 1 file changed, 1 insertion(+)
 create mode 100644 test-2.txt

$ git show 5b86313
commit 5b863135d9ca043baaca57bf553c6fbbb881950f (HEAD -> main)
Author: <username> <email>
Date:   Fri May 2 21:27:51 2025 +0200

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
* 5b86313 5691da5 (HEAD -> main) test-2.txt dosyasini ekledim
| * 3c9874b 5691da5 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
|/  
* 5691da5 a0d61de Dosyaya Merhaba Dunya ekledim
* a0d61de Ilk commit
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
*   76b2782 5b86313 3c9874b (HEAD -> main) Merge branch 'yeni-branch'
|\  
| * 3c9874b 5691da5 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | 5b86313 5691da5 test-2.txt dosyasini ekledim
|/  
* 5691da5 a0d61de Dosyaya Merhaba Dunya ekledim
* a0d61de Ilk commit
```
# --8<-- [end:git-log-2]
# --8<-- [start:git-show]
```bash hl_lines="3"
$ git show 76b2782
commit 76b2782390749f0e9b702fd63e8a10d1af5aa6b8 (HEAD -> main)
Merge: 5b86313 3c9874b
Author: <username> <email>
Date:   Fri May 2 21:27:52 2025 +0200

    Merge branch 'yeni-branch'

```
# --8<-- [end:git-show]
