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
[dal-A 380af38] test.txt dal-A icin degistirdim
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
[dal-B c077697] test.txt dal-B icin degistirdim
 1 file changed, 1 insertion(+), 1 deletion(-)
```
# --8<-- [end:git-first-commit]
# --8<-- [start:git-log-1]
```bash 
$ git log --graph --all --oneline
* c077697 (HEAD -> dal-B) test.txt dal-B icin degistirdim
| * 380af38 (dal-A) test.txt dal-A icin degistirdim
|/  
* 1b30337 (main) dal-B icin degisiklik yaptim
*   76b2782 Merge branch 'yeni-branch'
|\  
| * 3c9874b (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | 5b86313 test-2.txt dosyasini ekledim
|/  
* 5691da5 Dosyaya Merhaba Dunya ekledim
* a0d61de Ilk commit
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
[dal-A c428542] Merge branch 'dal-B' into dal-A
```
# --8<-- [end:git-merge-continue]
# --8<-- [start:git-log-2]
```bash hl_lines="2"
$ git log --graph --all --oneline --parents
*   c428542 380af38 c077697 (HEAD -> dal-A) Merge branch 'dal-B' into dal-A
|\  
| * c077697 1b30337 (dal-B) test.txt dal-B icin degistirdim
* | 380af38 1b30337 test.txt dal-A icin degistirdim
|/  
* 1b30337 76b2782 (main) dal-B icin degisiklik yaptim
*   76b2782 5b86313 3c9874b Merge branch 'yeni-branch'
|\  
| * 3c9874b 5691da5 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | 5b86313 5691da5 test-2.txt dosyasini ekledim
|/  
* 5691da5 a0d61de Dosyaya Merhaba Dunya ekledim
* a0d61de Ilk commit
```
# --8<-- [end:git-log-2]
