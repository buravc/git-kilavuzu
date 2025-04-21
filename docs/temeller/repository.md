# Repository

Git ile çalışmaya başlamadan önce ilk yapmamız gereken şey ya zaten repository olan bir klasöre geçmek, ya da yeni bir klasörde repository oluşturmak.

Biz yeni bir klasör oluşturup repository oluşturarak başlayacağız. Öncelikle `git-notlari-calisma` adında bir klasör oluşturup içine girerek bir git repository'si oluşturacağız.

```bash
$ mkdir git-notlari-calisma && cd git-notlari-calisma

$ git init

Initialized empty Git repository in ...../git-notlari-calisma/.git/
```

!!! tip "Unix Bilgisi"
    Shell ortamında iki komutu `&&` operatörü ile zincirleme olarak çalıştırabilirsiniz. Böylece ilk komut başarısız olursa ikinci komut hiç çalışmayacaktır.

Peki `git init` komutu bize ne sağladı? İlk bakışta klasörün içinde değişen hiçbir şey göremiyor olabilirsiniz. Ancak artık klasörün içinde `.git` isminde gizli bir klasör oluşmuş durumda. 

!!! tip "Unix Bilgisi"
    Bu klasörün gizli olmasının sebebi isminin `.` karakteri ile başlıyor olmasıdır. Eğer ki Unix bazlı bir sistemdeyseniz bu varsayılan bir davranıştır. Bu davranışı klasörün içinde `ls` komutu çalıştırıp terminalde hiçbir şeyin listelenmediğini görerek doğrulayabilirsiniz. Ancak `ls -a` şeklinde çalıştırdığınızda bu klasörün varlığını görebilirsiniz.

Bu `.git` klasörünün bulunması mevcut klasöre bir git repository’si olma niteliği kazandırıyor. Peki bu klasörün içinde neler var?

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

Burada çok fazla dosya ve klasör listelenmiş durumda. Hangi klasör ne işe yarıyor? Bir git repository’si bu kadar bilgi mi içeriyor? Bunlara yavaş yavaş ilerleyen zamanlarda değineceğiz. Şimdi en temel git yapılarından biri olan bir *commit* atmayı deneyelim.
