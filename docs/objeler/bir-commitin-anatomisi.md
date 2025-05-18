Commit'ler bir git repository'sinin yapıtaşıdır. Bir repository'nin kilometre taşı olarak isimlendirebiliriz. Repository'mizin geçmişte hangi aşamalardan geçtiğini gösterir. Repository geçmişinde kayıt altına alınan bu değişiklikleri bir kişiye atfeder. Repository'miz üzerinde farklı durumlara geçip farklı çalışmalar yapmamıza olanak tanır. Henüz ana akıma almaya hazır olmadığımız değişiklikleri ayrı tutmamıza olanak tanır. Ve tüm bu özellikleri git kullanıcıdan soyutlanmış bir şekilde sağlar. Commit'ler kalıcı halde saklanmalarına rağmen repository'mizin dosyaları arasında yer tutmazlar. Bize görünmez bir şekilde varlıklarını sürdürürler. Peki kilometre taşlarımız olan bu commit'ler nerede?

Yazımızın girişinde bir repository dizininde bulunan `.git` dizinin içeriğine bakmıştık ve bu dizinin içinde bulunduğu dizine git repository'si olma niteliği kazandırdığını dile getirmiştik. Üzerinde çalıştığımız repository'mize yazımız boyunca farklı değişikliklerde bulunduk. Bu işlemlerin sonucunda repository'mizin `.git` klasörüne tekrar bakarak, yazının başındaki haline kıyasla ne gibi değişikliklerin olduğunu gözlemleyelim.

-8<- "bir_commitin_anatomisi.md:git-tree-1"

Artık `.git` dizinimizin içinde branch'lerimizi görebiliyoruz. Buna ek olarak `objects` dizininin altında çok sayıda kayıt görüyoruz. `objects` dizininin içinde çok sayıda 2 harfli dizin, ve o dizinlerin altında da commit hash'lerimize benzeyen kayıtlar görüyoruz.

Bu aşamada bu hash gibi ismi olan kayıtların hepsinin aslında bizim commit'lerimiz olduğunu düşünmek için bir varsayımda bulunabiliriz. Fakat kayıtların sayısı bizim repository'deki commit'lerimizin sayısından daha fazla gibi gözüküyor. Bu ön yargımız doğru mu? Bu önermemizin doğruluğunu ispatlamaya çalışalım.

!!! tip "Unix Bilgisi"
    Buradaki ispatımızda `wc` isimli aracı kullanacağız. `wc` ismi **word count** kelimelerinin kısaltmasından gelmektedir. Kendisine beslenen girdi hakkında sayım bilgisi verir. Biz `-l` bayrağını kullanarak girdimizde kaç satır olduğunu göstereceğiz.
    
    Buna ek olarak `find` komutunu kullanarak `.git/objects` klasöründe **recursive** bir şekilde dosya listeleme yapacağız. `ls` yerine `find` aracını tercih etmemizin sebebi ise her satıra yalnızca bir dosya isminin basılmasına ihtiyaç duymamız. Bu ihtiyacı `ls` ile gerçekleştirmek bu aşama için gereksiz bir karmaşıklık meydana getirecektir. Buna ek olarak dizinleri basmamasını, yani sadece dosyaları basmasını istediğimiz için `-type f` bayrağını kullanacağız. Bu çıktıyı `wc` komutuna besleyerek dosya sayısını öğreneceğiz.

-8<- "bir_commitin_anatomisi.md:commit-vs-object-count"

`git log` komutunun bize verdiği bilgiye göre repository'mizde sadece `{{ bir_commitin_anatomisi.total_commit_count }}` adet commit bulunuyorken `.git/objects` dizininde `{{ bir_commitin_anatomisi.total_object_count }}` adet kayıt bulunmaktadır. Bu bulgulardan yola çıkarak repository'mizde mevcutta commit'lerimizden daha fazla objemizin olduğu sonucuna varıyoruz. Peki commit'lerimiz de bir obje sayılıyor mu? Objelerle birlikte mi saklanıyor?

Dikkatli bakarsak `.git/objects` dizininin altında commit hash'lerimizi bulmamız mümkün. Fakat bunu yapmak için normalde yapacağımızdan farklı bir yöntem izlememiz gerekiyor. Aramak istediğimiz commit hash'imizin ilk iki karakterini alarak saklandığı dizini bulduktan sonra o dizin içindeki dosyalarda ismi commit hash'imizin son 38 karakterine eşit olan dosya bizim commit'imiz olacaktır.

Örnek olarak `{{ bir_commitin_anatomisi.head_commit_hash }}` hash'li commitimiz `.git/objects/{{ bir_commitin_anatomisi.head_commit_partitioned_path }}` şeklinde saklanmaktadır.

!!! note "Objelerin alt dizinlere ayrılması"
    Bir git repository'sinin yapısı gereği çok sayıda objeye sahip olması olağan bir durumdur. Git objeleri `objects` dizininde saklarken hash'lerinin ilk 2 karakterine göre alt dizinlere yerleştirir. Bu sayede büyük repository'lerde çok büyük sayılarda objeler olmasına rağmen objeler içinde arama yapmayı gerektiren işlemlerin zamansal karmaşıklığında iyileşme sağlanır. Bu işlem veritabanı sistemlerinde yapılan **partition** işlemiyle benzer bir yaklaşım ortaya koyar.

-8<- "bir_commitin_anatomisi.md:ls-commit-object"

Bu sayede commit'lerimizin bir dosya halinde `.git/objects` dizininin altında saklandığını göstermiş olduk. Bu noktada commit'lerimizin nasıl saklandığını, hangi formatta saklandığını ve içinde neler bulunduğunu da gösterelim.

!!! warning "Obje Dosyalarının Formatı"
    Commit'imiz bir dosya halinde saklandığı için `cat` komutu ile terminalimize bastırabiliriz ancak git'in objeleri saklamak için kullandığı dosya biçimi `xml`, `json` veya `yaml` gibi insan tarafından kolaylıkla okunabilecek bir format olmadığı için, yani **binary** bir formatta olduğu için `cat` komutunu kullansak bile ekrana belli bir anlam taşıyan karakterler basmaktan farklı bir sonuca ulaşamayız.

Git'in kendi formatıyla sakladığı bir git objesinin içeriğinde ne olduğunu öğrenmek için git'ten yardım alarak `git cat-file` komutunu kullanmamız gerekmektedir. Bu komut ile birlikte git obje dosyasını açarak okunabilir bir formatta ekrana basacaktır. Bu komut yardımı ile mevcut commit'imizin anatomisini gözden geçirebiliriz.

-8<- "bir_commitin_anatomisi.md:cat-file-head-commit"

Buradan da açıkça görüldüğü üzere commit'imizi meydana getiren öğeler şunlardır:

- tree
- parent commit
- author kişi ve zamanı
- commiter kişi ve zamanı
- commit mesajı

!!! note "Author ve Commiter"
    Bu aşamaya kadar bizim git'i kullanım biçimimiz gereği `author` ve `commiter` daima aynı kişiye işaret edecektir. Yazıya karmaşıklık eklemekten kaçınmak amacıyla bu iki öğenin farkını bu aşamada açıklamaktan kaçınmayı tercih ediyorum.

Burada listelenmiş öğelere, `tree` öğesi haricinde daha önce değinmiştik. Fakat commit'imizin repository'mizde meydana getirdiği değişiklikleri burada bir öğe olarak göremiyoruz. O halde commit'in yaptığı değişiklikler nerede saklanıyor?

Kılavuzumuzda commit'lere değinirken commit'lerimizin repository'mizin o andaki halinin bir kopyasını sakladığından bahsetmiştik. Bu ifade ile commit'lerimizin aslında ayrı ayrı dosyalarda yaptığımız değişiklikleri saklamadığını dolaylı olarak ifade etmiş oluyoruz.

Commit'ler repository'nin bir kopyasını saklıyor ifadesi doğrudan olmasa da dolaylı olarak doğru bir ifadedir. Bir commit aslında repository'mizin herhangi bir andaki dizin ağacına işaret etmektedir. Yukarıda listelediğimiz `tree` öğesi aslında repository'mizin commit'i attığımız andaki dizin yapısını recursive bir şekilde saklayan bir objeye işaret etmektedir.
