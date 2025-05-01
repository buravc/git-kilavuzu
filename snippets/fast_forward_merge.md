# --8<-- [start:git-commit]
```bash 
$ git checkout -b "dal-B"
Switched to a new branch 'dal-B'

$ echo "dal B icin degisiklik" >> test.txt

$ git add test.txt

$ git commit -m "dal-B icin degisiklik yaptim"
[dal-B 2ea23bb] dal-B icin degisiklik yaptim
 1 file changed, 1 insertion(+)

$ git log --graph --all --oneline
* 2ea23bb (HEAD -> dal-B) dal-B icin degisiklik yaptim
*   a3cf991 (main) Merge branch 'yeni-branch'
|\  
| * 3be1429 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | bdb78d0 test-2.txt dosyasini ekledim
|/  
* be76ce7 Dosyaya Merhaba Dunya ekledim
* 0831d6c Ilk commit
```
# --8<-- [end:git-commit]
# --8<-- [start:git-merge]
```bash hl_lines="6"
$ git checkout main
Switched to branch 'main'

$ git merge dal-B
Updating a3cf991..2ea23bb
Fast-forward
 test.txt | 1 +
 1 file changed, 1 insertion(+)
```
# --8<-- [end:git-merge]
# --8<-- [start:git-log]
```bash 
$ git log --graph --all --oneline
* 2ea23bb (HEAD -> main, dal-B) dal-B icin degisiklik yaptim
*   a3cf991 Merge branch 'yeni-branch'
|\  
| * 3be1429 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | bdb78d0 test-2.txt dosyasini ekledim
|/  
* be76ce7 Dosyaya Merhaba Dunya ekledim
* 0831d6c Ilk commit
```
# --8<-- [end:git-log]
