# Baslamadan Once

Git cok yetenekli ve surekli gelismekte olan bir arac. Ben de hala bazi yeteneklerini ve uc senaryolarini yeni kesfetmekteyim. Bu yazinin amaci git'in butun yeteneklerine deginmek degildir. Git'e giris 101 seviyesinden, yani **branch** acip **commit** atip **push** atmak'tan daha ileri seviyede dokunan Turkce bir kaynaga pek denk gelemedigim icin bu dokumani hazirlamak istedim. Bu yaziya ek olarak her zaman git'in kullanma klavuzunu veya [dokumanini](https://git-scm.com/docs) okumanizi tavsiye ederim. Burada verebilecegimden cok daha fazlasini barindiran bir kaynaktir.

!!! warning "Varsayilan Bilgi Seviyesi"
    Basit seviyede git bilginizin oldugunu ve git ile calismis oldugunuz varsayarak yaziya devam edecegim. Temellere elimden geldigince deginmeye calisacak olsam da bu yazinin ana amaci git'i 101 seviyesinden ote anlamaya yardimci olacak bir Turkce kaynak olusturmaktir.
!!! warning "Varsayilan Sistem"
    Bu dokumani Unix bir sistemde calisildigini varsayarak hazirliyorum. Yazida herhangi bir gorsel uygulama (JetBrains, SourceTree, Visual Studio) kullanmaktan kacinacagim. Sadece **shell** komutlari uzerinden anlatim yapacagim. **MacOS** veya **Linux** bir isletim sistemindeyseniz calistirilan komutlarda bir uyumsuzluk yasamayacaksiniz. **Windows**'ta calisiyorsaniz **WSL (Windows Subsystem for Linux)** kurarak bir Linux altsistemi icerisinde Terminal baslatarak calismanizi oneririm. Aksi taktirde Windows'un komut sistemi Unix sistemlerle onemli davranis farkliliklari sergiledigi icin uyum sorunlari yasamaniz kacinilmaz olacaktir.
!!! tip "Unix Bilgisi"
    Git konusunda hizlica bilgi almak isterseniz terminalinizde her zaman asagidaki komutlardan birini calistirabilirsiniz.
    ```bash
    $ man git # git'in kullanma klavuzunu acar
    $ git --help
    $ git <command> --help # ornegin: git commit --help
    ```