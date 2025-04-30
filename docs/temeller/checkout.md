# Checkout

İlk commit’lerimizi atarak repository’mizde iki düğümlü bir değişiklik ağacı oluşturduk.

-8<- "checkout.md:git-log-graph"

Burada sıralanan her düğüm aslında repository’mizin o commit’in atıldığı andaki yapısını bire bir içermektedir. Diğer bir deyişle bu commit’lerin her biri repository’mizin o andaki bir kopyasını temsil etmektedir. Repository’mizde yapılan her değişiklik üzerine repository’mizin son hâlini elle yedeklemek yerine bir commit atarak kayıt altına alıyoruz.

Bir kopyadan diğerine, veya diğer bir deyiş ile bir commit’ten diğerine geçerek dosyaları incelemek istersek `checkout` komutunu kullanabiliriz. Örneğin bir önceki commit’imiz olan `{{ checkout.long_commit_hash }}` hash’li commit’e şu şekilde dönebiliriz:

!!! tip "Daha kısa hash"
    Bir git commit’inin hash’i 40 karakterden oluşuyor. Ancak git ile çalışırken sürekli 40 karakterin tamamını girmek çok verimli bir yöntem değil. Bunun yerine genellikle ilk 7 karakteri girmeniz yeterli oluyor.
    
!!! tip "Kısa Hash’i Çakışan Commit’ler"
    Bir repository’de ilk 7 karakteri aynı olan iki commit’in denk gelme ihtimali $16^7 = 268,\!435,\!456$’dır. Dolayısıyla bu ihtimal oldukça düşük. Bunun yaşandığı durumda çalıştırdığınız git komutu hata atacaktır.

-8<- "checkout.md:git-checkout"

!!! note 
    Burada git’in bize verdiği uyarıların ve `detached HEAD` teriminin ne anlama geldiğinin ilerleyen zamanlarda edindiğimiz bilgiler ışığında tekrar üzerinden geçeceğiz.

Son satırdaki `HEAD is now at {{ checkout.short_commit_hash }} Ilk commit` çıktısı ile birlikte repository’mizin o commit’teki kopyasına başarı ile döndüğünü görüyoruz. Şimdi `test.txt` dosyasının içeriğine bakarsak o andaki hâline döndüğünü göreceğiz.

-8<- "checkout.md:cat-test-txt"

`git checkout main` komutuyla repository’mizi eski hâline alarak ile kaldığımız yerden devam edelim.
