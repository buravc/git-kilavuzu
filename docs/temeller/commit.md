# Commit

Commit atabilmemiz için öncelikle repository içerisinde bir değişiklik yapmamız gerekli. Burada `test.txt` isminde bir dosya oluşturarak içerisine `Hello world` yazdırabiliriz.

-8<- "commit/initial-echo.md"

!!! tip "Unix Bilgisi"
    `echo` komutu yazdığımız metni tekrar etmeye yarayan bir komuttur. Yukarıda ise echo'nun çıktısının `>` ile `test.txt` isminde bir dosyaya yönlendirilmesini sağladık. Bu dosya eğer ki yoksa otomatik olarak oluşturulmaktadır. Bu dosyanın içeriğini doğrulamak için `cat test.txt` komutunu çalıştırabilirsiniz.

Şimdi ise `git` yaptığımız değişikliği görebiliyor mu bunu `git status` ile kontrol edelim.

-8<- "commit/initial-git-status.md"

Burada görülebileceği üzere git oluşturduğumuz `test.txt` dosyasını `Untracked files` altında listelemiş durumda. `Untracked` aslında bu dosyanın henüz git tarafından repository veritabanına kaydedilmemiş olduğunu belirtmekte. Bu aşamada hâlâ bir commit atamıyoruz çünkü bu dosyayı henüz git'e, daha doğrusu git'in index'ine eklemedik. Gelin ekleyelim.

-8<- "commit/git-initial-add-status.md"

Eklediğimiz dosyanın `new file` olarak listelendiğini görebiliyoruz. Artık commit atmaya hazırız. Commit mesajımıza `İlk commit` yazarak ilk commit’imizi atabiliriz.

!!! note "Commit Sahipliği"
    Bir git repository'sinde atılan commit’lerin bir sahibi olmak zorundadır. Biz henüz git'e kendi kullanıcı adı ve e-posta adresimizi tanıtmadık. Aşağıdaki komutlar ile git’in ayarlarına bunu eklemeyi unutmayalım.
    ```bash
    $ git config --global user.name "<username>"
    $ git config --global user.email "<email>"
    ```

-8<- "commit/git-initial-commit.md"

Artık ilk commit’imizi atmış durumdayız. Repository’mizin geçmişine bakarak bunu onaylayalım.

-8<- "commit/git-initial-log.md"

Artık repository’mizde hash’i `{{ commit.first_commit_hash }}` olan bir commit’imiz bulunmakta. Şimdi gelin minik bir değişiklik yapıp ikinci bir commit daha atalım. Bu sefer `test.txt` dosyasında ufak bir değişiklik yapalım.

-8<- "commit/echo-merhaba-dunya-status.md"

!!! tip "Unix Bilgisi"
    Bu sefer `echo` komutundan sonra `>` yerine `>>` operatörü kullanmamızın sebebi `test.txt` dosyasının içeriğinin üzerine yazmak yerine komutun çıktısının dosyanın sonuna eklenmesini istiyoruz. `>` operatörü dosyanın içeriğinin tamamını silerken `>>` operatörü sadece dosyanın sonuna ekleme yapmaktadır.

Gördüğünüz üzere bu sefer yaptığımız değişikliklere rağmen dosya `Untracked` olarak isimlendirilmiyor. Bunun sebebi ise bir önceki attığımız commit ile birlikte bu dosyanın mevcut durumda git’in index’inde zaten yer alıyor olması. Artık yaptığımız değişiklik `modified` olarak gözüküyor. Bu sefer dosyanın yeni hâlini git’in index’ine eklememiz gerekiyor.

-8<- "commit/second-add-status.md"

Şimdi yeni bir commit atabiliriz.

-8<- "commit/second-commit.md"

Artık repository’mizin en son hâline bakabiliriz. Bu sefer `git log` komutumuza `--graph` bayrağını ekleyerek bakalım.

-8<- "commit/second-log.md"

Artık yeni bir commit’imiz var ve hash’i `{{ commit.second_commit_hash }}` olarak oluşmuş. Ve bir önceki commit’e de bağlantısı `*` ve üzerindeki çizgiler ile gösterilmiş durumda. Eğer ki commit’lerin yaptığı değişiklikleri de burada görmek isterseniz `log` komutuna `--patch` bayrağını ekleyebilirsiniz.

-8<- "commit/third-log-patch.md"