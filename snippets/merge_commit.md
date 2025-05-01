# --8<-- [start:git-commit-main]
```bash 
$ git checkout main
Switched to branch 'main'

$ echo "Lorem ipsum" > test-2.txt

$ git add test-2.txt

$ git commit -m "test-2.txt dosyasini ekledim"
[main 609d322] test-2.txt dosyasini ekledim
 1 file changed, 1 insertion(+)
 create mode 100644 test-2.txt

$ git show 609d322
commit 609d3224a6a3526ab207b17c6817c6735ee8ba1d (HEAD -> main)
Author: <username> <email>
Date:   Thu May 1 17:51:48 2025 +0200

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
* 609d322 c391943 (HEAD -> main) test-2.txt dosyasini ekledim
| * 694de91 c391943 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
|/  
* c391943 469f4cb Dosyaya Merhaba Dunya ekledim
* 469f4cb Ilk commit
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
*   b7806ed 609d322 694de91 (HEAD -> main) Merge branch 'yeni-branch'
|\  
| * 694de91 c391943 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | 609d322 c391943 test-2.txt dosyasini ekledim
|/  
* c391943 469f4cb Dosyaya Merhaba Dunya ekledim
* 469f4cb Ilk commit
```
# --8<-- [end:git-log-2]
# --8<-- [start:git-show]
```bash hl_lines="3"
$ git show b7806ed
commit b7806ed4c276afc08bc504f76bfc799e8a2e516d (HEAD -> main)
Merge: 609d322 694de91
Author: <username> <email>
Date:   Thu May 1 17:51:49 2025 +0200

    Merge branch 'yeni-branch'

```
# --8<-- [end:git-show]
