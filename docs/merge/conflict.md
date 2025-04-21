# Conflict

Biri digerini kapsayan iki branch icin merge isleminde **fast-forward merge** yapilarak islemin sadelestirildigini ogrendik. Bunun uzerine birbirinden ayrilmis olan bir branch'i digerine merge ederken **fast-forward**'in mumkun olmadigini ogrendik. Simdi ise merge konusunda karsilasilabilecek bir durum'a deginecegim. Bunu bir ornek ile anlatalim.

`A` ve `B` isminde iki branch'imiz oldugunu varsayalim. `A` branch'indeyken `test.txt` dosyasinin **ilk** satirini degistirip bir commit attik. Artik `A` branch'imizde bu degisiklik bulunmakta. `B` branch'indeyken de ayni islemi tekrarladim ve **ilk** satiri degistirerek commit attik. Artik birbirinden ayri ve ayni dosya uzerinde farkli degisiklikleri olan 2 branch'imiz var. Peki bu durumda `B` branch'ini `A` branch'ine merge etmek istersek, git `test.txt` dosyasindaki iki farkli branch'teki degisikligi nasil birlestirecek?

```bash
$ git checkout -b dal-A
Switched to a new branch 'dal-A'

# burada test.txt dosyasini acip ilk satiri degistirelim. Sonrasinda ise siradaki komuttan devam edelim.

$ cat test.txt
dal-A Hello world
Merhaba Dunya
yeni-branch icin merhaba dunya
dal B icin degisiklik

$ git add test.txt

$ git commit -m "test-txt dal-A icin degistirdim"
[dal-A a1ef269] test-txt dal-A icin degistirdim
 1 file changed, 1 insertion(+), 1 deletion(-)

$ git checkout main
Switched to branch 'main'

$ git checkout dal-B # dal-B branch'imiz zaten hazir oldugu icin `-b` bayragini kullanarak yeni bir branch olusturmaktan kacindik.
Switched to branch 'dal-B'

# burada test.txt dosyasini acip ilk satiri yukaridakinden farkli bir sekilde degistirelim. Sonrasinda ise siradaki komuttan devam edelim.

$ cat test.txt
dal-B icin Hello world satiri yaziyorum
Merhaba Dunya
yeni-branch icin merhaba dunya
dal B icin degisiklik

$ git add test.txt

$ git commit -m "test-txt dal-B icin degistirdim"
[dal-B f3a666a] test-txt dal-B icin degistirdim
 1 file changed, 1 insertion(+), 1 deletion(-)
```

Simdi ise merge isleminden once repository'mizin son haline bakalim.

```bash
$ git log --graph --all --oneline
* f3a666a (HEAD -> dal-B) test-txt dal-B icin degistirdim
| * a1ef269 (dal-A) test-txt dal-A icin degistirdim
|/  
* bf6c603 (main) dal-B icin degisiklik yaptim
*   b979b40 Merge branch 'yeni-branch'
|\  
| * c973c9d (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | a26b42a test-2.txt dosyasini ekledim
|/  
* 419a640 Dosyaya Merhaba Dunya ekledim
* beddf6b Ilk commit
```

`dal-A` ve `dal-B` branch'leri birbirinden ayrilmis durumda. `dal-A` branch'ine gecerek `dal-B` branch'ini merge edelim.


```bash
$ git checkout dal-A
Switched to branch 'dal-A'

$ git merge dal-B
Auto-merging test.txt
CONFLICT (content): Merge conflict in test.txt
Automatic merge failed; fix conflicts and then commit the result.
```

Gordugunuz gibi bir hata ile karsilastik. Burada sozlugumuze yeni bir terimi ekleyebiliriz. **Conflict** bir git islemi sirasinda bir dosya uzerinde meydana gelen, ve birbirini kapsamayan iki farkli commit'teki degisikligin birbiriyle cakismasi durumudur.

Bu noktada repository'miz artik ozel bir duruma gecmistir. Git bu merge esnasinda olusan **conflict**'in manuel olarak cozulmesini beklemektedir. Repository'mizin son durumuna bakarak durum hakkinda bir fikir sahibi olalim.

```bash
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

Bu noktada yukarida git'in de bize acikca belirttigi uzere iki secenegimiz bulunmaktadir.

- Merge islemini iptal ederek `dal-A` branch'ine geri donmektir. Bunu `git merge --abort` ile yapabilirsiniz.
- Olusan **conflict**'i elle cozebilirsiniz.

Bu conflict'i elle cozmek icin oncelikle **conflict** olan `test.txt` dosyamizin icerigine goz atalim.

```bash
$ cat test.txt
<<<<<<< HEAD
dal-A Hello world
=======
dal-B icin Hello world satiri yaziyorum
>>>>>>> dal-B
Merhaba Dunya
yeni-branch icin merhaba dunya
dal B icin degisiklik
```

Goruldugu uzere iki branch'te yapilan farkli degisiklikler dosyanin icerisinde mevcut ancak aralarina ozel isaretleyiciler konularak ayrilmis. Burada bu **conflict**'i elle cozmek icin bu dosyayi bir text editor yardimiyla acarak son halinin nasil olmasini istedigimize karar vermek.

Bu ornegimiz acisindan bir editor yardimi ile `dal-B` branch'inden gelen satiri tutup kalanini silerek devam edebiliriz. Daha sonrasinda ise merge islemine devam edelim.

```bash
$ cat test.txt
dal-B icin Hello world satiri yaziyorum
Merhaba Dunya
yeni-branch icin merhaba dunya
dal B icin degisiklik

$ git add test.txt

$ git merge --continue
# acilan editor ile merge commit'imizin mesajini duzenleyerek kaydedip kapatalim.
[dal-A 6c72e42] Merge branch 'dal-B' into dal-A
```

Merge islemini basarili bir sekilde tamamladiktan sonra `git log` su sekilde gorunecektir.

```bash
$ git log --graph --all --oneline --parents
*   6c72e42 a1ef269 f3a666a (HEAD -> dal-A) Merge branch 'dal-B' into dal-A
|\  
| * f3a666a bf6c603 (dal-B) test-txt dal-B icin degistirdim
* | a1ef269 bf6c603 test-txt dal-A icin degistirdim
|/  
* bf6c603 b979b40 (main) dal-B icin degisiklik yaptim
*   b979b40 a26b42a c973c9d Merge branch 'yeni-branch'
|\  
| * c973c9d 419a640 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | a26b42a 419a640 test-2.txt dosyasini ekledim
|/  
* 419a640 beddf6b Dosyaya Merhaba Dunya ekledim
* beddf6b Ilk commit
```

!!! note "Merge Commit'inde degisiklik"
    Eger ki bu **conflict**'i cozerken `test.txt` uzerinde git'in **index**'inde bulunmayan farkli bir degisiklik yapmis olsaydik, ornegin yeni bir satira yeni bir yazi ekleseydik, merge commit'imizde bu degisiklik yer alacakti.
    ```bash
    $ git show 3bfac7d
    commit 3bfac7da6102da926b2ad4f319f22e3c617c26c8 (HEAD -> dal-A)
    Merge: a1ef269 f3a666a
    Author: <username> <email>
    Date:   Mon Apr 21 18:52:14 2025 +0200

    Merge branch 'dal-B' into dal-A

    diff --cc test.txt
    index f995c5f,2c7ce7b..39d67bc
    --- a/test.txt
    +++ b/test.txt
    @@@ -1,4 -1,4 +1,5 @@@
    - dal-A Hello world
    + dal-B icin Hello world satiri yaziyorum
    ++--> Conflict cozerken bu yeni satiri ekledim <--
      Merhaba Dunya
      yeni-branch icin merhaba dunya
      dal B icin degisiklik
    ```