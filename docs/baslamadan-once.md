# Başlamadan Önce

Git çok yetenekli ve sürekli gelişmekte olan bir araç. Ben de hala bazı yeteneklerini ve uç senaryosunu yeni keşfetmekteyim. Bu yazının amacı git'in bütün yeteneklerine değinmek değildir. Git'e giriş 101 seviyesinden, yani **branch** açıp **commit** atıp **push** atmak'tan daha ileri seviyede dokunan Türkçe bir kaynağa pek denk gelemediğim için bu dokümanı hazırlamak istedim. Bu yazıya ek olarak her zaman git'in kullanma kılavuzunu veya [dokümanını](https://git-scm.com/docs) okumanızı tavsiye ederim. Burada verebileceğimden çok daha fazlasını barındıran bir kaynaktır.

Bu dokümanı hazırlarken kullandığım git versiyonu aşağıdadır.

!!! note "Komutlar"
    `$` başlayan satırlardaki komutları terminalde çalıştırabilirsiniz. Yazı boyunca bu formatı sürdürmeye devam edeceğim. Böylece komutlar ile çıktıları ayırt etmek kolaylaşacaktır.

```bash
$ git --version
git version 2.48.1
```

!!! warning "Varsayılan Bilgi Seviyesi"
    Basit seviyede git bilginizin olduğunu ve git ile çalışmış olduğunuz varsayarak yazıya devam edeceğim. Temellere elimden geldiğince değinmeye çalışacak olsam da bu yazının ana amacı git'i 101 seviyesinden öte anlamaya yardımcı olacak bir Türkçe kaynak oluşturmaktır.

!!! warning "Varsayılan Sistem"
    Bu dokümanı Unix bir sistemde çalışıldığını varsayarak hazırlıyorum. Yazıda herhangi bir görsel uygulama (JetBrains, SourceTree, Visual Studio) kullanmaktan kaçınacağım. Sadece **shell** komutları üzerinden anlatım yapacağım. **MacOS** veya **Linux** bir işletim sistemindeyseniz çalıştırılan komutlarda bir uyumsuzluk yaşamayacaksınız. **Windows**'ta çalışıyorsanız **WSL (Windows Subsystem for Linux)** kurarak bir Linux alt sistemi içerisinde Terminal başlatarak çalışmanızı öneririm. Aksi takdirde Windows'un komut sistemi Unix sistemlerle önemli davranış farklıkları sergilediği için uyum sorunları yaşamanız kaçınılmaz olacaktır.

!!! tip "Unix Bilgisi"
    Git konusunda hızlıca bilgi almak isterseniz terminalinizde her zaman aşağıdaki komutlardan birini çalıştırabilirsiniz. Bunu `git` haricinde de kullandığınız bir çok araç için uygulayabilirsiniz. `#` karakterinden sonraki kısım yorum olarak kabul edilir.
    ```bash
    $ man git # git'in kullanma kılavuzunu açar
    $ git --help
    $ git <command> --help # örneğin: git commit --help
    ```
