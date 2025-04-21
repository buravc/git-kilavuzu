# Branch Olusturmak

Ilk commitlerimizi attik ve artik 2 committen olusan bir git repository'sine sahibiz.

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

Simdi ise git'in bir baska temeli olan bir **branch** olusturalim. Branch'imizin adina `yeni-branch` diyelim. Hemen ardindan ise git'i bu branch'e gecirelim, yani **checkout** ettirelim. Son olarak da repository'de bulunan butun branch'leri listeleyelim.

!!! note "Terminoloji"
    **Branch** Turkcede bir butunun bir alt dali anlamina gelmektedir. Agac dali, egitim dali gibi baglamlardaki kullanimi ornek gosterilebilir. Git baglaminda ise **branch** dallanan, bir noktadan ayrilan commit'leri isaret etmek icin kullanilir.

```bash
$ git branch yeni-branch

$ git checkout yeni-branch
Switched to branch 'yeni-branch'

$ git branch
  main
* yeni-branch
```

!!! tip "Kisayol"
    Burada tek bir eylem icin iki ayri komutunun bulunmasinin sebebi **checkout** komutunun farkli bir islevinin olmasidir. Tek komut ile yeni bir branch olusturup ona **checkout** etmek icin `git checkout -b yeni-branch` yapabilirsiniz.

Peki bu yaptigimiz eylemler ne ise yaradi? Bir branch olusturduk ve ona gectik ancak bu bize ne sagladi ki? Repository'de neler degisti? Bu noktada aslinda bir branch'in somut olarak neye donustugunu anlamamiz gerekli.

Bu sorunun cevabi icin bir onceki sayfada da bahsettigimiz `.git` klasorunun icine bakalim. Yeni bir branch olusturunca burada git ne yapiyor olabilir?

```bash
$ ls .git/refs/heads
main            yeni-branch
```

Burada 2 adet dosya olusmus gorunuyor. Dosyalarin isimleri ise repository'mizdeki branch'lerin isimleri ile uyusuyor. Peki bu dosyalarin icinde ne bulunuyor?

```bash
$ cat .git/refs/heads/main
419a640a88ca3d23399c51c5f398f2d3684a66bf

$ cat .git/refs/heads/yeni-branch
419a640a88ca3d23399c51c5f398f2d3684a66bf
```

Iclerinde bir hash bulunuyor ve bu hash bizim son commit'imizin hashi ile ayni. Yani branch'ler aslinda bir commit'e isaret eden bir dosyadan ibaretler. Bunu `git log` calistirarak da gorebiliriz.

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

Burada `419a640a88ca3d23399c51c5f398f2d3684a66bf` hash'li commit'imize `yeni-branch` ve `main` branch'lerinin isaret ettigini commit hash'inin yainda bulunan `(HEAD -> yeni-branch, main)` bolumu ile gorebiliyoruz.

Simdi yeni bir commit daha atalim ve sonrasinda `git log` ile repository'mize tekrar bakalim.

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

`main` branch'imiz hala bir onceki commit'e isaret ediyorken `yeni-branch` isimli branch'imiz yeni attigimiz `c973c9d315307caedfb39a99413067c4a2f3e1ff` hash'li commit'e isaret etmekte. Peki `.git` klasorunde ne degisiklik oldu?

```bash
$ cat .git/refs/heads/main
419a640a88ca3d23399c51c5f398f2d3684a66bf

$ cat .git/refs/heads/yeni-branch
c973c9d315307caedfb39a99413067c4a2f3e1ff
```

Yukarisi bize gosteriyor ki sadece `yeni-branch` dosyasinin icindeki hash degismis durumda. Yani git terminolojisinde branch dedigimiz temel yapi aslinda sadece bir commit isaretcisi olarak calisiyor. Biz o branch'teyken ne kadar commit atarsak atalim aslinda sadece son attigimiz commit'in hash'ina isaret eden bir dosyadan ibaret. Bu dizinde bir dosya olusturarak yeni bir git branch'i olusturabildigimizi gelin test edelim.

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

Yukaridaki `echo` komutu ile bir commit hash'ini `.git/refs/heads` dizininde yeni bir dosyaya yazdirdik. Bunun sonucunda da git'in yeni branch'imizi tanidigini gormus olduk. Buradan anlasiliyor ki branch yapisi onceki attigimiz commit'lerin bir listesini herhangi bir yerde tutmuyor. Peki o zaman git bu commit'lerin ve branch'lerin takibini nasil yapiyor?