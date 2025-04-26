# Commit

Commit atabilmemiz için öncelikle repository içerisinde bir değişiklik yapmamız gerekli. Burada `test.txt` isminde bir dosya oluşturarak içerisine `Hello world` yazdırabiliriz.

```bash
$ echo "Hello world" > test.txt
```

!!! tip "Unix Bilgisi"
    `echo` komutu yazdığımız metni tekrar etmeye yarayan bir komuttur. Yukarıda ise echo'nun çıktısının `>` ile `test.txt` isminde bir dosyaya yönlendirilmesini sağladık. Bu dosya eğer ki yoksa otomatik olarak oluşturulmaktadır. Bu dosyanın içeriğini doğrulamak için `cat test.txt` komutunu çalıştırabilirsiniz.

Şimdi ise `git` yaptığımız değişikliği görebiliyor mu bunu `git status` ile kontrol edelim.

```bash hl_lines="6-8"
$ git status
On branch main

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        test.txt

nothing added to commit but untracked files present (use "git add" to track)
```

Burada görülebileceği üzere git oluşturduğumuz `test.txt` dosyasını `Untracked files` altında listelemiş durumda. `Untracked` aslında bu dosyanın henüz git tarafından repository veritabanına kaydedilmemiş olduğunu belirtmekte. Bu aşamada hâlâ bir commit atamıyoruz çünkü bu dosyayı henüz git'e, daha doğrusu git'in index'ine eklemedik. Gelin ekleyelim.

```bash
$ git add test.txt

$ git status
On branch main

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   test.txt
```

Eklediğimiz dosyanın `new file` olarak listelendiğini görebiliyoruz. Artık commit atmaya hazırız. Commit mesajımıza `İlk commit` yazarak ilk commit’imizi atabiliriz.

!!! note "Commit Sahipliği"
    Bir git repository'sinde atılan commit’lerin bir sahibi olmak zorundadır. Biz henüz git'e kendi kullanıcı adı ve e-posta adresimizi tanıtmadık. Aşağıdaki komutlar ile git’in ayarlarına bunu eklemeyi unutmayalım.
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

Artık ilk commit’imizi atmış durumdayız. Repository’mizin geçmişine bakarak bunu onaylayalım.

```bash
$ git log
* commit beddf6b7c7155af30f8a73f349094c72bfa93a43 (HEAD -> main)
  Author: <username> <email>
  Date:   Sun Apr 20 13:48:57 2025 +0200
  
      Ilk commit
```

Artık repository’mizde hash’i `beddf6b7c7155af30f8a73f349094c72bfa93a43` olan bir commit’imiz bulunmakta. Şimdi gelin minik bir değişiklik yapıp ikinci bir commit daha atalım. Bu sefer `test.txt` dosyasında ufak bir değişiklik yapalım.

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
    Bu sefer `echo` komutundan sonra `>` yerine `>>` operatörü kullanmamızın sebebi `test.txt` dosyasının içeriğinin üzerine yazmak yerine komutun çıktısının dosyanın sonuna eklenmesini istiyoruz. `>` operatörü dosyanın içeriğinin tamamını silerken `>>` operatörü sadece dosyanın sonuna ekleme yapmaktadır.

Gördüğünüz üzere bu sefer yaptığımız değişikliklere rağmen dosya `Untracked` olarak isimlendirilmiyor. Bunun sebebi ise bir önceki attığımız commit ile birlikte bu dosyanın mevcut durumda git’in index’inde zaten yer alıyor olması. Artık yaptığımız değişiklik `modified` olarak gözüküyor. Bu sefer dosyanın yeni hâlini git’in index’ine eklememiz gerekiyor.

```bash
$ git add test.txt

$ git status
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   test.txt
```

Şimdi yeni bir commit atabiliriz.

```bash
$ git commit -m "Dosyaya Merhaba Dunya ekledim"
[main 419a640] Dosyaya Merhaba Dunya ekledim
 1 file changed, 1 insertion(+)
```

Artık repository’mizin en son hâline bakabiliriz. Bu sefer `git log` komutumuza `--graph` bayrağını ekleyerek bakalım.

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

Artık yeni bir commit’imiz var ve hash’i `419a640a88ca3d23399c51c5f398f2d3684a66bf` olarak oluşmuş. Ve bir önceki commit’e de bağlantısı `*` ve üzerindeki çizgiler ile gösterilmiş durumda. Eğer ki commit’lerin yaptığı değişiklikleri de burada görmek isterseniz `log` komutuna `--patch` bayrağını ekleyebilirsiniz.

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
