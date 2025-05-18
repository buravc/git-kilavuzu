Commit'ler bir git repository'sinin yapitasidir. Bir repository'nin kilometretasi olarak isimlendirebiliriz. Repository'mizin gecmiste hangi asamalardan gectigini gosterir. Repository gecmisinde kayit altina alinan bu degisiklikleri bir kisiye atfeder. Repository'miz uzerinde farkli durumlara gecip farkli calismalar yapmamiza olanak tanir. Henuz ana akima almaya hazir olmadigimiz degisiklikleri ayri tutmamiza olanak tanir. Ve tum bu ozellikleri git kullanicidan soyutlanmis bir sekilde saglar. Commit'ler kalici halde saklanmalarina ragmen repository'mizin dosyalari arasinda yer tutmazlar. Bize gorunmez bir sekilde varliklarini surdururler. Peki kilometretaslarimiz olan bu commit'ler neredeler o zaman?

Yazimizin girisinde bir repository dizininde bulunan `.git` dizinin icerigine bakmistik ve bu dizinin icinde bulundugu dizine git repository'si olma niteligi kazandirdigini dile getirmistik. Uzerinde calistigimiz repository'mize yazimiz boyunca farkli degisikliklerde bulunduk. Bu islemlerin sonucunda repository'mizin `.git` klasorune tekrar bakarak, yazinin basindaki haline kiyasla ne gibi degisikliklerin oldugunu gozlemleyelim.

-8<- "bir_commitin_anatomisi.md:git-tree-1"

Artik `.git` dizinimizin icinde branch'lerimizi gorebiliyoruz. Buna ek olarak `objects` dizininin altinda cok sayida kayit goruyoruz. `objects` dizininin icinde cok sayida 2 harfli dizin, ve o dizinlerin altinda da commit hash'lerimize benzeyen kayitlar goruyoruz.

Bu asamada bu hash gibi ismi olan kayitlarin hepsinin aslinda bizim commit'lerimiz oldugunu dusunmek icin bir varsayimda bulunabiliriz. Fakat kayitlarin sayisi bizim repository'deki commitlerimizin sayisindan daha fazla gibi gozukuyor. Bu onyargimiz dogru mu? Bu onermemizin dogrulugunu ispatlamaya calisalim.

!!! tip "Unix Bilgisi"
    Buradaki ispatimizda `wc` isimli araci kullanacagiz. `wc` ismi **word count** kelimelerinin kisaltmasindan gelmektedir. Kendisine beslenen girdi hakkinda sayim bilgisi verir. Biz `-l` bayragini kullanarak girdimizde kac satir oldugunu gosterecegiz.
    
    Buna ek olarak `find` komutunu kullanarak `.git/objects` klasorunde **recursive** bir sekilde dosya listeleme yapacagiz. `ls` yerine `find` aracini tercih etmemizin sebebi ise her satira yalnizca bir dosya isminin basilmasina ihtiyac duymamiz. Bu ihtiyaci `ls` ile gerceklestirmek bu asama icin gereksiz bir karmasiklik meydana getirecektir. Buna ek olarak dizinleri basmamasini, yani sadece dosyalari basmasini istedigimiz icin `-type f` bayragini kullanacagiz. Bu ciktiyi `wc` komutuna besleyerek dosya sayisini ogrenecegiz.

-8<- "bir_commitin_anatomisi.md:commit-vs-object-count"

`git log` komutunun bize verdigi bilgiye gore repository'mizde sadece `{{ bir_commitin_anatomisi.total_commit_count }}` adet commit bulunuyorken `.git/objects` dizininde `{{ bir_commitin_anatomisi.total_object_count }}` adet kayit bulunmakta. Bu bulgulardan yolacikarak repository'mizde mevcutta commit'lerimizden daha fazla objemizin oldugu sonucuna variyoruz. Peki commit'lerimiz de bir obje sayiliyor mu? Objelerle birlikte mi saklaniyor?

Dikkatli bakarsak `.git/objects` dizininin altinda commit hash'lerimizi bulmamiz mumkun. Fakat bunu yapmak icin normalde yapacagimizdan farkli bir yontem izlememiz gerekiyor. Aramak istedigimiz commit hash'imizin ilk iki karakterini alarak saklandigi dizini bulduktan sonra o dizin icerisindeki dosyalarda ismi commit hash'imizin son 38 karakterine esit olan dosya bizim commitimiz olacaktir.

Ornek olarak `{{ bir_commitin_anatomisi.head_commit_hash }}` hash'li commitimiz `.git/objects/{{ bir_commitin_anatomisi.head_commit_partitioned_path }}` seklinde saklanmaktadir.

!!! note "Objelerin alt dizinlere ayrilmasi"
    Bir git repository'sinin yapisi geregi cok sayida objeye sahip olmasi olagan bir durumdur. Git objeleri `objects` dizininde saklarken hash'lerinin ilk 2 karakterine gore alt dizinlere yerlestirir. Bu sayede buyuk repository'lerde cok buyuk sayilarda objeler olmasina ragmen objeler icinde arama yapmayi gerektiren islemlerin zamansal karmasikliginda iyilesme saglanir. Bu islem veritabani sistemlerinde yapilan **partition** islemiyle benzer bir yaklasim ortaya koyar.

-8<- "bir_commitin_anatomisi.md:ls-commit-object"

Bu sayede commit'lerimizin bir dosya halinde `.git/objects` dizininin altinda saklandigini gostermis olduk. Bu noktada commit'lerimizin nasil saklandigini, hangi formatta saklandigini ve icinde neler bulundugunu da gosterelim.

!!! warning "Obje Dosyalarinin Formati"
    Commit'imiz bir dosya halinde saklandigi icin `cat` komutu ile terminalimize bastirabiliriz ancak git'in objeleri saklamak icin kullandigi dosya bicimi `xml`, `json` veya `yaml` gibi insan tarafindan kolaylikla okunabilecek bir format olmadigi icin, yani **binary** bir formatta oldugu icin `cat` komutunu kullansak bile ekrana belli bir anlam tasimayan karakterler basmaktan farkli bir sonuca ulasamayiz.

Git'in kendi formatiyla sakladigi bir git objesinin iceriginde ne oldugunu ogrenmek icin git'ten yardim alarak `git cat-file` komutunu kullanmamiz gerekmektedir. Bu komut ile birlikte git obje dosyasini acarak okunabilir bir formatta ekrana basacaktir. Bu komut yardimi ile mevcut commit'imizin anatomisini gozden gecirebiliriz.

-8<- "bir_commitin_anatomisi.md:cat-file-head-commit"

Buradan da acikca goruldugu uzere commit'imizi meydana getiren ogeler sunlardir.

- tree
- parent commit
- author kisi ve zamani
- commiter kisi ve zamani
- commit mesaji

!!! note "Author ve Commiter"
    Bu asamaya kadar bizim git'i kullanis bicimimiz geregi `author` ve `commiter` daima ayni kisiye isaret edecektir. Yaziya karmasiklik eklemekten kacinmak amaciyla bu iki ogenin farkini bu asamada aciklamaktan kacinmayi tercih ediyorum.

Burada listelenmis ogelere, `tree` ogesi haricinde daha once deginmistik. Fakat commit'imizin repository'mizde meydana getirdigi degisiklikleri burada bir oge olarak goremiyoruz. O halde commit'in yaptigi degisiklikler nerede saklaniyor?

Kilavuzumuzda commit'lere deginirken commit'lerimizin repository'mizin o andaki halinin bir kopyasini sakladigindan bahsetmistik. Bu ifade ile commit'lerimizin aslinda ayri ayri dosyalarda yaptigimiz degisiklikleri saklamadigini dolayli olarak ifade etmis oluyoruz.

Commit'ler repository'nin bir kopyasini sakliyor ifadesi dogrudan olmasa da dolayli olarak dogru bir ifadedir. Bir commit aslinda repository'mizin herhangi bir andaki dizin agacina isaret etmektedir. Yukarida listeledigimiz `tree` ogesi aslinda repository'mizin commit'i attigimiz andaki dizin yapisini recursive bir sekilde saklayan bir objeye isaret etmektedir.