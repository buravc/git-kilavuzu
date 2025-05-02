# --8<-- [start:git-commit]
```bash 
$ git checkout -b "dal-B"
Switched to a new branch 'dal-B'

$ echo "dal B icin degisiklik" >> test.txt

$ git add test.txt

$ git commit -m "dal-B icin degisiklik yaptim"
[dal-B cef4e44] dal-B icin degisiklik yaptim
 1 file changed, 1 insertion(+)

$ git log --graph --all --oneline
* cef4e44 (HEAD -> dal-B) dal-B icin degisiklik yaptim
*   b5b6c09 (main) Merge branch 'yeni-branch'
|\  
| * dc2243f (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | 9a63d64 test-2.txt dosyasini ekledim
|/  
* 777f68a Dosyaya Merhaba Dunya ekledim
* 95e7356 Ilk commit
```
# --8<-- [end:git-commit]
# --8<-- [start:git-merge]
```bash hl_lines="6"
$ git checkout main
Switched to branch 'main'

$ git merge dal-B
Updating b5b6c09..cef4e44
Fast-forward
 test.txt | 1 +
 1 file changed, 1 insertion(+)
```
# --8<-- [end:git-merge]
# --8<-- [start:git-log]
```bash 
$ git log --graph --all --oneline
* cef4e44 (HEAD -> main, dal-B) dal-B icin degisiklik yaptim
*   b5b6c09 Merge branch 'yeni-branch'
|\  
| * dc2243f (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | 9a63d64 test-2.txt dosyasini ekledim
|/  
* 777f68a Dosyaya Merhaba Dunya ekledim
* 95e7356 Ilk commit
```
# --8<-- [end:git-log]
