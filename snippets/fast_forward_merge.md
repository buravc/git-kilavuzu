# --8<-- [start:git-commit]
```bash 
$ git checkout -b "dal-B"
Switched to a new branch 'dal-B'

$ echo "dal B icin degisiklik" >> test.txt

$ git add test.txt

$ git commit -m "dal-B icin degisiklik yaptim"
[dal-B f903294] dal-B icin degisiklik yaptim
 1 file changed, 1 insertion(+)

$ git log --graph --all --oneline
* f903294 (HEAD -> dal-B) dal-B icin degisiklik yaptim
*   b7806ed (main) Merge branch 'yeni-branch'
|\  
| * 694de91 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | 609d322 test-2.txt dosyasini ekledim
|/  
* c391943 Dosyaya Merhaba Dunya ekledim
* 469f4cb Ilk commit
```
# --8<-- [end:git-commit]
# --8<-- [start:git-merge]
```bash hl_lines="6"
$ git checkout main
Switched to branch 'main'

$ git merge dal-B
Updating b7806ed..f903294
Fast-forward
 test.txt | 1 +
 1 file changed, 1 insertion(+)
```
# --8<-- [end:git-merge]
# --8<-- [start:git-log]
```bash 
$ git log --graph --all --oneline
* f903294 (HEAD -> main, dal-B) dal-B icin degisiklik yaptim
*   b7806ed Merge branch 'yeni-branch'
|\  
| * 694de91 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | 609d322 test-2.txt dosyasini ekledim
|/  
* c391943 Dosyaya Merhaba Dunya ekledim
* 469f4cb Ilk commit
```
# --8<-- [end:git-log]
