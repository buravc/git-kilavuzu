# Conflict

Biri diğerini kapsayan iki branch için merge işleminde **fast-forward merge** yapılarak işlemin sadeleştirildiğini öğrendik. Bunun üzerine birbirinden ayrılmış olan bir branch'i diğerine merge ederken **fast-forward**'in mümkün olmadığını öğrendik. Şimdi ise merge konusunda karşılaşılabilecek bir duruma değineceğim. Bunu bir örnek ile anlatalım.

`A` ve `B` isminde iki branch'imiz olduğunu varsayalım. `A` branch'indeyken `test.txt` dosyasının **ilk** satırını değiştirip bir commit attık. Artık `A` branch'imizde bu değişiklik bulunmakta. `B` branch'indeyken de aynı işlemi tekrarladım ve **ilk** satırı değiştirerek commit attık. Artık birbirinden ayrı ve aynı dosya üzerinde farklı değişiklikleri olan 2 branch'imiz var. Peki bu durumda `B` branch'ini `A` branch'ine merge etmek istersek, git `test.txt` dosyasındaki iki farklı branch'teki değişikliği nasıl birleştirecek?

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

$ git checkout dal-B # dal-B branch'imiz zaten hazir oldugu icin `-b` bayragini kullanmayarak yeni bir branch olusturmaktan kacindik.
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

Şimdi ise merge işleminden önce repository'mizin son haline bakalım.

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

`dal-A` ve `dal-B` branch'leri birbirinden ayrılmış durumda. `dal-A` branch'ine geçerek `dal-B` branch'ini merge edelim.

```bash
$ git checkout dal-A
Switched to branch 'dal-A'

$ git merge dal-B
Auto-merging test.txt
CONFLICT (content): Merge conflict in test.txt
Automatic merge failed; fix conflicts and then commit the result.
```

Gördüğünüz gibi bir hata ile karşılaştık. Burada sözlüğümüze yeni bir terimi ekleyebiliriz. **Conflict** bir git işlemi sırasında bir dosya üzerinde meydana gelen, ve birbirini kapsamayan iki farklı commit'teki değişikliğin birbiriyle çakışması durumudur.

Bu noktada repository'miz artık özel bir duruma geçmiştir. Git bu merge esnasında oluşan **conflict**'in manuel olarak çözülmesini beklemektedir. Repository'mizin son durumuna bakarak durum hakkında bir fikir sahibi olalım.

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

Bu noktada yukarıda git'in de bize açıkça belirttiği üzere iki seçeneğimiz bulunmaktadır:

- Merge işlemini iptal ederek `dal-A` branch'ine geri dönmektir. Bunu `git merge --abort` ile yapabilirsiniz.
- Oluşan **conflict**'i elle çözebilirsiniz.

Bu conflict'i elle çözmek için öncelikle **conflict** olan `test.txt` dosyamızın içeriğine göz atalım.

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

Görüldüğü üzere iki branch'te yapılan farklı değişiklikler dosyanın içerisinde mevcut ancak aralarına özel işaretleyiciler konularak ayrılmış. Burada bu **conflict**'i elle çözmek için bu dosyayı bir text editor yardımıyla açarak son halinin nasıl olmasını istediğimize karar vermek.

Bu örneğimiz açısından bir editor yardımı ile `dal-B` branch'inden gelen satırı tutup kalanını silerek devam edebiliriz. Daha sonrasında ise merge işlemine devam edelim.

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

Merge işlemini başarılı bir şekilde tamamladıktan sonra `git log` şu şekilde görünecektir.

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

2 adet parent commit'e bakan yeni bir **merge commit** ile iki commit dalı birbirine başarılı bir şekilde bağlanmış ve `dal-A` branch'i bu yeni commit'e taşınmış durumda.

!!! note "Merge Commit'inde değişiklik"
    Eğer ki bu **conflict**'i çözerken `test.txt` üzerinde git'in **index**'inde bulunmayan farklı bir değişiklik yapmış olsaydık, örneğin yeni bir satıra yeni bir yazı ekleseydik, merge commit'imizde bu değişiklik yer alacaktı.
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