# Checkout

İlk commit’lerimizi atarak repository’mizde iki düğümlü bir değişiklik ağacı oluşturduk.

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

Burada sıralanan her düğüm aslında repository’mizin o commit’in atıldığı andaki yapısını bire bir içermektedir. Diğer bir deyişle bu commit’lerin her biri repository’mizin o andaki bir kopyasını temsil etmektedir. Repository’mizde yapılan her değişiklik üzerine repository’mizin son hâlini elle yedeklemek yerine bir commit atarak kayıt altına alıyoruz.

Bir kopyadan diğerine, veya diğer bir deyiş ile bir commit’ten diğerine geçerek dosyaları incelemek istersek `checkout` komutunu kullanabiliriz. Örneğin bir önceki commit’imiz olan `beddf6b7c7155af30f8a73f349094c72bfa93a43` hash’li commit’e şu şekilde dönebiliriz:

!!! tip "Daha kısa hash"
    Bir git commit’inin hash’i 40 karakterden oluşuyor. Ancak git ile çalışırken sürekli 40 karakterin tamamını girmek çok verimli bir yöntem değil. Bunun yerine genellikle ilk 7 karakteri girmeniz yeterli oluyor.
    
!!! tip "Kısa Hash’i Çakışan Commit’ler"
    Bir repository’de ilk 7 karakteri aynı olan iki commit’in denk gelme ihtimali $16^7 = 268,\!435,\!456$’dır. Dolayısıyla bu ihtimal oldukça düşük. Bunun yaşandığı durumda çalıştırdığınız git komutu hata atacaktır.

```bash
$ git checkout beddf6b
Note: switching to 'beddf6b'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at beddf6b Ilk commit
```

!!! note 
    Burada git’in bize verdiği uyarıların ve `detached HEAD` teriminin ne anlama geldiğinin ilerleyen zamanlarda edindiğimiz bilgiler ışığında tekrar üzerinden geçeceğiz.

Son satırdaki `HEAD is now at beddf6b Ilk commit` çıktısı ile birlikte repository’mizin o commit’teki kopyasına başarı ile döndüğünü görüyoruz. Şimdi `test.txt` dosyasının içeriğine bakarsak o andaki hâline döndüğünü göreceğiz.

```bash
$ cat test.txt
Hello world
```

`git checkout main` komutuyla repository’mizi eski hâline alarak ile kaldığımız yerden devam edelim.
