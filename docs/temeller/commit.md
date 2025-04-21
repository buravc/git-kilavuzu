# Commit atmak

Commit atabilmemiz icin oncelikle repository icerisinde bir degisiklik yapmamiz gerekli. Burada `test.txt` isminde bir dosya olusturarak icerisine `Hello world` yazdirabiliriz.

```bash
$ echo "Hello world" > test.txt
```

!!! tip "Unix Bilgisi"
    `echo` komutu yazdigimiz texti tekrar etmeye yarayan bir komuttur. Yukarida ise echo'nun ciktisinin `>` ile `test.txt` isminde bir dosyaya yonlendirilmesini sagladik. Bu dosya eger ki yoksa otomatik olarak olusturulmaktadir. Bu dosyanin icerigini dogrulamak icin `cat test.txt` komutunu calistirabilirsiniz.

Simdi ise git yaptigimiz degisikligi gorebiliyor mu `git status` ile kontrol edelim.

```bash
$ git status
On branch main

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        test.txt

nothing added to commit but untracked files present (use "git add" to track)
```

Burada gorulebilecegi uzere git olusturdugumuz `test.txt` dosyasini `Untracked files` altinda listelemis durumda. `Untracked` aslinda bu dosyanin henuz git tarafindan repository veritabanina kaydedilmemis oldugunu belirtmekte. Bu asamada hala bir commit atamiyoruz cunku bu dosyayi henuz git'e, daha dogrusu git'in index'ine eklemedik eklemedik. Gelin ekleyelim.

```bash
$ git add test.txt

$ git status
On branch main

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   test.txt
```

Ekledigimiz dosyayin `new file` olarak listelendigini gorebiliyoruz. Artik commit atmaya haziriz. Commit mesajimiza `Ilk commit` yazarak ilk commitimizi atabiliriz.

!!! note "Commit Sahipligi"
    Bir git repository'sinde atilan commit'lerin bir sahibi olmak zorundadir. Biz henuz git'e kendi kullanici adi ve email adresimizi tanitmadik. Asagidaki komutlar ile git'in ayarlarina bunu eklemeyi unutmayalim.
    ```bash
    $ git config --global user.name "<username>"
    $ git config --global user.email "<email>"
    ```

```bash
$ git commit -m "Ilk commit"
[main (root-commit) beddf6b] Ilk commit
 1 file changed, 1 insertion(+)
 create mode 100644 test.txt
```

Artik ilk commit'imizi atmis durumdayiz. Repository'mizin gecmisine bakarak bunu onaylayalim.

```bash
$ git log
* commit beddf6b7c7155af30f8a73f349094c72bfa93a43 (HEAD -> main)
  Author: <username> <email>
  Date:   Sun Apr 20 13:48:57 2025 +0200
  
      Ilk commit
```

Artik repository'mizde hash'i `beddf6b7c7155af30f8a73f349094c72bfa93a43` olan bir commit'imiz bulunmakta. Simdi gelin minik bir degisiklik yapip ikinci bir commit daha atalim. Bu sefer `test.txt` dosyasinda ufak bir degisiklik yapalim.

```bash
$ echo "Merhaba Dunya" >> test.txt

$ git status
On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   test.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

!!! tip "Unix Bilgisi"
    Bu sefer `echo` komutundan sonra `>` yerine `>>` operatoru kullanmamizin sebebi `test.txt` dosyasinin iceriginin uzerine yazmak yerine komutun ciktisinin dosyanin sonuna eklenmesini istiyoruz. `>` operatoru dosyanin iceriginin tamamini silerken `>>` operatoru sadece dosyanin sonuna ekleme yapmaktadir.

Gordugunuz uzere bu sefer yaptigimiz degisikliklere ragmen dosya `Untracked` olarak isimlendirilmiyor. Bunun sebebi ise bir onceki attigimiz commit ile birlikte bu dosyanin mevcut durumda git'in index'inde zaten yer aliyor olmasi. Artik yaptigimiz degisiklik `modified` olarak gozukuyor. Bu sefer dosyanin yeni halini git'in index'ine eklememiz gerekiyor.

```bash
$ git add test.txt

$ git status
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   test.txt
```

Simdi yeni bir commit atabiliriz.

```bash
$ git commit -m "Dosyaya Merhaba Dunya ekledim"
[main 419a640] Dosyaya Merhaba Dunya ekledim
 1 file changed, 1 insertion(+)
```

Artik repository'mizin en son haline bakabiliriz. Bu sefer `git log` komutumuza `--graph` bayragini ekleyerek bakalim.

```bash
$ git log --graph
* commit 419a640a88ca3d23399c51c5f398f2d3684a66bf (HEAD -> main)
| Author: <username> <email>
| Date:   Sun Apr 20 14:07:41 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit beddf6b7c7155af30f8a73f349094c72bfa93a43
  Author: <username> <email>
  Date:   Sun Apr 20 13:48:57 2025 +0200
  
      Ilk commit
```

Artik yeni bir commit'imiz var ve hash'i `419a640a88ca3d23399c51c5f398f2d3684a66bf` olarak olusmus. Ve bir onceki commit'e de baglantisi `*` ve uzerindeki cizgiler ile gosterilmis durumda. Eger ki commit'lerin yaptigi degisiklikleri de burada gormek isterseniz `log` komutuna `--patch` bayragini ekleyebilirsiniz.

```bash
$ git log --graph --patch
* commit 419a640a88ca3d23399c51c5f398f2d3684a66bf (HEAD -> main)
| Author: <username> <email>
| Date:   Sun Apr 20 14:07:41 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
| diff --git a/test.txt b/test.txt
| index 802992c..da9d8ba 100644
| --- a/test.txt
| +++ b/test.txt
| @@ -1 +1,2 @@
|  Hello world
| +Merhaba Dunya
| 
* commit beddf6b7c7155af30f8a73f349094c72bfa93a43
  Author: <username> <email>
  Date:   Sun Apr 20 13:48:57 2025 +0200
  
      Ilk commit
  
  diff --git a/test.txt b/test.txt
  new file mode 100644
```