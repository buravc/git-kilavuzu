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
[dal-A 9ee4e2a] test.txt dal-A icin degistirdim
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
[dal-B 9397a77] test.txt dal-B icin degistirdim
 1 file changed, 1 insertion(+), 1 deletion(-)
```
# --8<-- [end:git-first-commit]
# --8<-- [start:git-log-1]
```bash 
$ git log --graph --all --oneline
* 9397a77 (HEAD -> dal-B) test.txt dal-B icin degistirdim
| * 9ee4e2a (dal-A) test.txt dal-A icin degistirdim
|/  
* 2ea23bb (main) dal-B icin degisiklik yaptim
*   a3cf991 Merge branch 'yeni-branch'
|\  
| * 3be1429 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | bdb78d0 test-2.txt dosyasini ekledim
|/  
* be76ce7 Dosyaya Merhaba Dunya ekledim
* 0831d6c Ilk commit
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
[dal-A 09304ae] Merge branch 'dal-B' into dal-A
```
# --8<-- [end:git-merge-continue]
# --8<-- [start:git-log-2]
```bash hl_lines="2"
$ git log --graph --all --oneline --parents
*   09304ae 9ee4e2a 9397a77 (HEAD -> dal-A) Merge branch 'dal-B' into dal-A
|\  
| * 9397a77 2ea23bb (dal-B) test.txt dal-B icin degistirdim
* | 9ee4e2a 2ea23bb test.txt dal-A icin degistirdim
|/  
* 2ea23bb a3cf991 (main) dal-B icin degisiklik yaptim
*   a3cf991 bdb78d0 3be1429 Merge branch 'yeni-branch'
|\  
| * 3be1429 be76ce7 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | bdb78d0 be76ce7 test-2.txt dosyasini ekledim
|/  
* be76ce7 0831d6c Dosyaya Merhaba Dunya ekledim
* 0831d6c Ilk commit
```
# --8<-- [end:git-log-2]
