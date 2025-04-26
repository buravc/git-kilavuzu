# Branch

İlk commitlerimizi attık ve artık 2 committen oluşan bir git repository'sine sahibiz.

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

Şimdi ise git'in bir başka temeli olan bir **branch** oluşturalım. Branch'imizin adını `yeni-branch` diyelim. Hemen ardından ise git'i bu branch'e geçirelim, yani **checkout** ettirelim. Son olarak da repository'de bulunan bütün branch'leri listeleyelim.

!!! note "Terminoloji"
    **Branch** Türkçede bir bütünün bir alt dalı anlamına gelmektedir. Ağaç dalı, eğitim dalı gibi bağlamlardaki kullanımı örnek gösterilebilir. Git bağlamında ise **branch** dallanan, bir noktadan ayrılan commit'leri işaret etmek için kullanılır.

```bash
$ git branch yeni-branch

$ git checkout yeni-branch
Switched to branch 'yeni-branch'

$ git branch
  main
* yeni-branch
```

!!! tip "Kısayol"
    Burada tek bir eylem için iki ayrı komutunun bulunmasının sebebi **checkout** komutunun farklı bir işlevinin olmasıdır. Tek komut ile yeni bir branch oluşturup ona **checkout** etmek için `git checkout -b yeni-branch` yapabilirsiniz.

Peki bu yaptığımız eylemler ne işe yaradı? Bir branch oluşturduk ve ona geçtik ancak bu bize ne sağladı ki? Repository'de neler değişti? Bu noktada aslında bir branch'in somut olarak neye dönüştüğünü anlamamız gerekli.

Bu sorunun cevabı için bir önceki sayfada da bahsettiğimiz `.git` klasörünün içine bakalım. Yeni bir branch oluşturunca burada git ne yapıyor olabilir?

```bash
$ ls .git/refs/heads
main            yeni-branch
```

Burada 2 adet dosya oluşmuş görünüyor. Dosyaların isimleri ise repository'mizdeki branch'lerin isimleri ile uyuşuyor. Peki bu dosyaların içinde ne bulunuyor?

```bash
$ cat .git/refs/heads/main
419a640a88ca3d23399c51c5f398f2d3684a66bf

$ cat .git/refs/heads/yeni-branch
419a640a88ca3d23399c51c5f398f2d3684a66bf
```

İçlerinde bir hash bulunuyor ve bu hash bizim son commit'imizin hash'i ile aynı. Yani branch'ler aslında bir commit'e işaret eden bir dosyadan ibaretler. Bunu `git log` çalıştırarak da görebiliriz.

```bash
$ git log --graph
* commit 419a640a88ca3d23399c51c5f398f2d3684a66bf (HEAD -> yeni-branch, main)
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

Burada `419a640a88ca3d23399c51c5f398f2d3684a66bf` hash'li commit'imize `yeni-branch` ve `main` branch'lerinin işaret ettiğini commit hash'inin yanında bulunan `(HEAD -> yeni-branch, main)` bölümü ile görebiliyoruz.

Şimdi yeni bir commit daha atalım ve sonrasında `git log` ile repository'mize tekrar bakalım.

```bash
$ echo "yeni-branch icin merhaba dunya" >> test.txt
$ git add test.txt
$ git commit -m "yeni-branch icin ilk commitimi atiyorum"
[yeni-branch c973c9d] yeni-branch icin ilk commitimi atiyorum
 1 file changed, 1 insertion(+)

$ git log --graph
* commit c973c9d315307caedfb39a99413067c4a2f3e1ff (HEAD -> yeni-branch)
| Author: <username> <email>
| Date:   Sun Apr 20 15:10:20 2025 +0200
| 
|     yeni-branch icin ilk commitimi atiyorum
| 
* commit 419a640a88ca3d23399c51c5f398f2d3684a66bf (main)
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

`main` branch'imiz hala bir önceki commit'e işaret ediyorken `yeni-branch` isimli branch'imiz yeni attığımız `c973c9d315307caedfb39a99413067c4a2f3e1ff` hash'li commit'e işaret etmekte. Peki `.git` klasöründe ne değişiklik oldu?

```bash
$ cat .git/refs/heads/main
419a640a88ca3d23399c51c5f398f2d3684a66bf

$ cat .git/refs/heads/yeni-branch
c973c9d315307caedfb39a99413067c4a2f3e1ff
```

Yukarısı bize gösteriyor ki sadece `yeni-branch` dosyasının içindeki hash değişmiş durumda. Yani git terminolojisinde branch dediğimiz temel yapı aslında sadece bir commit işaretçisi olarak çalışıyor. Biz o branch'teyken ne kadar commit atarsak atalım aslında sadece son attığımız commit'in hash'ına işaret eden bir dosyadan ibaret. Bu dizinde bir dosya oluşturarak yeni bir git branch'i oluşturabildiğimizi gelin test edelim.

```bash
$ git branch
  main
* yeni-branch

$ echo "c973c9d315307caedfb39a99413067c4a2f3e1ff" > .git/refs/heads/yeni-branch-2

$ git branch
  main
* yeni-branch
  yeni-branch-2

$ git checkout yeni-branch-2
Switched to branch 'yeni-branch-2'
```

Yukarıdaki `echo` komutu ile bir commit hash'ini `.git/refs/heads` dizininde yeni bir dosyaya yazdırdık. Bunun sonucunda da git'in yeni branch'imizi tanıdığını görmüş olduk. Buradan anlaşılıyor ki branch yapısı önceki attığımız commit'lerin bir listesini herhangi bir yerde tutmuyor. Peki o zaman git bu commit'lerin ve branch'lerin takibini nasıl yapıyor?
