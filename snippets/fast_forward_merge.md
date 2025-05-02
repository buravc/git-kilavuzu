# --8<-- [start:git-commit]
```bash 
$ git checkout -b "dal-B"
Switched to a new branch 'dal-B'

$ echo "dal B icin degisiklik" >> test.txt

$ git add test.txt

$ git commit -m "dal-B icin degisiklik yaptim"
[dal-B 1b30337] dal-B icin degisiklik yaptim
 1 file changed, 1 insertion(+)

$ git log --graph --all --oneline
* 1b30337 (HEAD -> dal-B) dal-B icin degisiklik yaptim
*   76b2782 (main) Merge branch 'yeni-branch'
|\  
| * 3c9874b (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | 5b86313 test-2.txt dosyasini ekledim
|/  
* 5691da5 Dosyaya Merhaba Dunya ekledim
* a0d61de Ilk commit
```
# --8<-- [end:git-commit]
# --8<-- [start:git-merge]
```bash hl_lines="6"
$ git checkout main
Switched to branch 'main'

$ git merge dal-B
Updating 76b2782..1b30337
Fast-forward
 test.txt | 1 +
 1 file changed, 1 insertion(+)
```
# --8<-- [end:git-merge]
# --8<-- [start:git-log]
```bash 
$ git log --graph --all --oneline
* 1b30337 (HEAD -> main, dal-B) dal-B icin degisiklik yaptim
*   76b2782 Merge branch 'yeni-branch'
|\  
| * 3c9874b (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | 5b86313 test-2.txt dosyasini ekledim
|/  
* 5691da5 Dosyaya Merhaba Dunya ekledim
* a0d61de Ilk commit
```
# --8<-- [end:git-log]
