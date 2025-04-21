# Checkout

Ilk commit'lerimizi atarak repository'mizde iki dugumlu bir degisiklik agaci olusturduk.

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

Burada siralanan her dugum aslinda repository'mizin o commit'in atildigi andaki yapisini bire bir icermektedir. Diger bir deyisle bu commit'lerin her biri repository'mizin o andaki bir kopyasini temsil etmektedir. Repository'mizde yapilan her degisiklik uzerine repository'mizin son halini elle yedeklemek yerine bir commit atarak kayit altina aliyoruz.

Bir kopyadan digerine, veya diger bir deyis ile bir commit'ten digerine gecerek dosyalari incelemek istersek `checkout` komutunu kullanabiliriz. Ornegin bir onceki commit'imiz olan `beddf6b7c7155af30f8a73f349094c72bfa93a43` hash'li commit'e su sekilde donebiliriz:

!!! tip "Daha kisa hash"
    Bir git commit'inin hash'i 40 karakterden olusuyor. Ancak git ile calisirken surekli 40 karakterin tamamini girmek cok verimli bir yontem degil. Bunun yerine genellikle ilk 7 karakteri girmeniz yeterli oluyor.
    
!!! tip "Kisa Hash'i Cakisan Commit'ler"
    Bir repository'de ilk 7 karakteri ayni olan iki commit'in denk gelme ihtimali $16^7 = 268,\!435,\!456$'dir. Dolayisiyla bu ihtimal oldukca dusuk. Bunun yasandigi durumda calistirdiginiz git komutu hata atacaktir.

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
    Burada git'in bize verdigi uyarilarin ve `detached HEAD` teriminin ne anlama geldiginin ilerleyen zamanlarda edindigimiz bilgiler isiginda tekrar uzerinden gececegiz.

Son satirdaki `HEAD is now at beddf6b Ilk commit` ciktisi ile birlikte repository'mizin o commit'teki kopyasina basari ile dondugunu goruyoruz. Simdi `test.txt` dosyasinin icerigine bakarsak o andaki haline dondugunu gorecegiz.

```bash
$ cat test.txt
Hello world
```

`git checkout main` komutu repository'mizi eski haline alarak ile kaldigimiz yerde devam edelim.