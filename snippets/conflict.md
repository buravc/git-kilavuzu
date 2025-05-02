# --8<-- [start:git-first-commit]
```bash 
$ git checkout -b dal-A
Switched to a new branch 'dal-A'

# burada test.txt dosyasini acip ilk satiri degistirelim. Sonrasinda ise siradaki komuttan devam edelim.

$ cat test.txt
dal-A icin Hello world satiri yaziyorum
Merhaba Dunya
yeni-branch icin merhaba-dunya
dal B icin degisiklik

$ git add test.txt

$ git commit -m "test.txt dal-A icin degistirdim"
[dal-A 8cd6f22] test.txt dal-A icin degistirdim
 1 file changed, 1 insertion(+), 1 deletion(-)

$ git checkout dal-B # dal-B branch'imiz zaten hazir oldugu icin `-b` bayragini kullanmayarak yeni bir branch olusturmaktan kacindik.
Switched to branch 'dal-B'

# burada test.txt dosyasini acip ilk satiri yukaridakinden farkli bir sekilde degistirelim. Sonrasinda ise siradaki komuttan devam edelim.

$ cat test.txt
dal-B icin Hello world satiri yaziyorum
Merhaba Dunya
yeni-branch icin merhaba-dunya
dal B icin degisiklik

$ git add test.txt

$ git commit -m "test.txt dal-B icin degistirdim"
[dal-B 2c6d144] test.txt dal-B icin degistirdim
 1 file changed, 1 insertion(+), 1 deletion(-)
```
# --8<-- [end:git-first-commit]
# --8<-- [start:git-log-1]
```bash 
$ git log --graph --all --oneline
* 2c6d144 (HEAD -> dal-B) test.txt dal-B icin degistirdim
| * 8cd6f22 (dal-A) test.txt dal-A icin degistirdim
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
# --8<-- [start:git-merge]
```bash hl_lines="6-7"
$ git checkout dal-A
Switched to branch 'dal-A'

$ git merge dal-B
Auto-merging test.txt
CONFLICT (content): Merge conflict in test.txt
Automatic merge failed; fix conflicts and then commit the result.
```
# --8<-- [end:git-merge]
# --8<-- [start:git-status]
```bash hl_lines="4-5"
$ git status
On branch dal-A
You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)

Unmerged paths:
  (use "git add <file>..." to mark resolution)
	both modified:   test.txt

no changes added to commit (use "git add" and/or "git commit -a")
```
# --8<-- [end:git-status]
# --8<-- [start:cat-conflicted-file]
```bash 
$ cat test.txt
<<<<<<< HEAD
dal-A icin Hello world satiri yaziyorum
=======
dal-B icin Hello world satiri yaziyorum
>>>>>>> dal-B
Merhaba Dunya
yeni-branch icin merhaba-dunya
dal B icin degisiklik
```
# --8<-- [end:cat-conflicted-file]
# --8<-- [start:git-merge-continue]
```bash 
$ cat test.txt
dal-B icin Hello world satiri yaziyorum
Merhaba Dunya
yeni-branch icin merhaba-dunya
dal B icin degisiklik

$ git add test.txt

$ git merge --continue # acilan editor ile merge commit'imizin mesajini duzenleyerek kaydedip kapatalim.
[dal-A eb02546] Merge branch 'dal-B' into dal-A
```
# --8<-- [end:git-merge-continue]
# --8<-- [start:git-log-2]
```bash hl_lines="2"
$ git log --graph --all --oneline --parents
*   eb02546 8cd6f22 2c6d144 (HEAD -> dal-A) Merge branch 'dal-B' into dal-A
|\  
| * 2c6d144 cef4e44 (dal-B) test.txt dal-B icin degistirdim
* | 8cd6f22 cef4e44 test.txt dal-A icin degistirdim
|/  
* cef4e44 b5b6c09 (main) dal-B icin degisiklik yaptim
*   b5b6c09 9a63d64 dc2243f Merge branch 'yeni-branch'
|\  
| * dc2243f 777f68a (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | 9a63d64 777f68a test-2.txt dosyasini ekledim
|/  
* 777f68a 95e7356 Dosyaya Merhaba Dunya ekledim
* 95e7356 Ilk commit
```
# --8<-- [end:git-log-2]
