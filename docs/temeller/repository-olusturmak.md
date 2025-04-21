# Repository Olusturmak

Git ile calismaya baslamadan once ilk yapmamiz gereken sey ya zaten repository olan bir klasore gecmek, ya da yeni bir klasorde repository olusturmak.

Biz yeni bir klasor olusturup repository olusturarak baslayacagiz. Oncelikle `git-notlari-calisma` adinda bir klasor olusturup icine girerek bir git repository'si olusturacagiz.

```bash
$ mkdir git-notlari-calisma && cd git-notlari-calisma

$ git init

Initialized empty Git repository in ...../git-notlari-calisma/.git/
```

!!! tip "Unix Bilgisi"
    Shell ortaminda iki komutu `&&` operatoru ile zincirleme olarak calistirabilirsiniz. Boylece ilk komut basarisiz olursa ikinci komut hic calismayacaktir.

Peki `git init` komutu bize ne sagladi? Ilk bakista klasorun icinde degisen hicbir sey goremiyor olabilirsiniz. Ancak artik klasorun icinde `.git` isminde gizli bir klasor olusmus durumda. 

!!! tip "Unix Bilgisi"
    Bu klasorun gizli olmasinin sebebi isminin `.` karakteri ile basliyor olmasidir. Eger ki Unix bazli bir sistemdeyseniz bu varsayilan bir davranistir. Bu davranisi klasorun icinde `ls` komutu calistirip terminalde hicbir seyin listelenmedigini gorerek dogrulayabilirsiniz. Ancak `ls -a` seklinde calistirdiginizda bu klasorun varligini gorebilirsiniz.

Bu `.git` klasorunun bulunmasi mevcut klasore bir git repository'si olma niteligi kazandiriyor. Peki bu klasorun icinde neler var?

```
$ tree .git
.git
├── HEAD
├── config
├── description
├── hooks
│   ├── applypatch-msg.sample
│   ├── commit-msg.sample
│   ├── fsmonitor-watchman.sample
│   ├── post-update.sample
│   ├── pre-applypatch.sample
│   ├── pre-commit.sample
│   ├── pre-merge-commit.sample
│   ├── pre-push.sample
│   ├── pre-rebase.sample
│   ├── pre-receive.sample
│   ├── prepare-commit-msg.sample
│   ├── push-to-checkout.sample
│   ├── sendemail-validate.sample
│   └── update.sample
├── info
│   └── exclude
├── objects
│   ├── info
│   └── pack
└── refs
    ├── heads
    └── tags

9 directories, 18 files
```

Burada cok fazla dosya ve klasor listelenmis durumda. Hangi klasor ne ise yariyor? Bir git repository'si bu kadar bilgi mi iceriyor? Bunlara yavas yavas ilerleyen zamanlarda deginecegiz. Simdi en temel git yapilarindan biri olan bir *commit* atmayi deneyelim.