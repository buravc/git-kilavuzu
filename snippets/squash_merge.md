# --8<-- [start:git-log-1]
```bash 
$ git log --graph --all --oneline
*   eb02546 (HEAD -> dal-A) Merge branch 'dal-B' into dal-A
|\  
| * 2c6d144 (dal-B) test.txt dal-B icin degistirdim
* | 8cd6f22 test.txt dal-A icin degistirdim
|/  
* cef4e44 (main) dal-B icin degisiklik yaptim
*   b5b6c09 Merge branch 'yeni-branch'
|\  
| * dc2243f (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | 9a63d64 test-2.txt dosyasini ekledim
|/  
* 777f68a Dosyaya Merhaba Dunya ekledim
* 95e7356 Ilk commit
```
# --8<-- [end:git-log-1]
# --8<-- [start:prepare-dal-b]
```bash 
$ git checkout dal-B
Switched to branch 'dal-B'

$ echo "Degisiklik-1" >> test.txt

$ git add test.txt

$ git commit -m "degisiklik-1"
[dal-B 8dd8796] degisiklik-1
 1 file changed, 1 insertion(+)

$ echo "Degisiklik-2" >> test.txt

$ git add test.txt

$ git commit -m "degisiklik-2"
[dal-B 5fa6930] degisiklik-2
 1 file changed, 1 insertion(+)

$ cat test.txt
dal-B icin Hello world satiri yaziyorum
Merhaba Dunya
yeni-branch icin merhaba-dunya
dal B icin degisiklik
Degisiklik-1
Degisiklik-2
```
# --8<-- [end:prepare-dal-b]
# --8<-- [start:squash-merge]
```bash 
$ git checkout dal-A
Switched to branch 'dal-A'

$ git merge --squash dal-B
Automatic merge went well; stopped before committing as requested
Squash commit -- not updating HEAD

$ git status
On branch dal-A
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   test.txt

```
# --8<-- [end:squash-merge]
# --8<-- [start:git-commit-log]
```bash 
$ git commit -m "squash merge dal-B"
[dal-A 7894926] squash merge dal-B
 1 file changed, 2 insertions(+)

$ git log --graph --all --oneline
* 7894926 (HEAD -> dal-A) squash merge dal-B
*   eb02546 Merge branch 'dal-B' into dal-A
|\  
* | 8cd6f22 test.txt dal-A icin degistirdim
| | * 5fa6930 (dal-B) degisiklik-2
| | * 8dd8796 degisiklik-1
| |/  
| * 2c6d144 test.txt dal-B icin degistirdim
|/  
* cef4e44 (main) dal-B icin degisiklik yaptim
*   b5b6c09 Merge branch 'yeni-branch'
|\  
| * dc2243f (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | 9a63d64 test-2.txt dosyasini ekledim
|/  
* 777f68a Dosyaya Merhaba Dunya ekledim
* 95e7356 Ilk commit
```
# --8<-- [end:git-commit-log]
# --8<-- [start:cat-test-txt]
```bash 
$ cat test.txt
dal-B icin Hello world satiri yaziyorum
Merhaba Dunya
yeni-branch icin merhaba-dunya
dal B icin degisiklik
Degisiklik-1
Degisiklik-2
```
# --8<-- [end:cat-test-txt]
