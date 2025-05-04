Onceki bolumlerde fast forward merge'ye deginirken bahsettigimiz onemli bir durum vardi. Bir branch diger branch'i kapsiyor mu? Bu sorgunun bizim icin onemi fast forward merge bolumunde one cikmisti. Fakat bu sorgunun ima ettiklerinin ayri bir bolumde deginilmeyi gerektirdigini dusunuyorum.

!!! note "Mental Model"
    Bu konuda git'i mental olarak modelleme bicimimizi tekrar gozden gecirmemizde fayda olacaktir. Bir branch bir commit'e isaret eden bir isaretcidir. Diger bir deyisle **bir branch ayni anda birden cok commit'e degil, yalnizca tek bir commit'e isaret eder.**
    
    Bir commit ise bir commit grafinin bir parcasidir ve kendisinden onceki commit'e veya commit'lere *parent* iliskisiyle baglidir.

Bir branch'in digerini kapsiyor olmasi durumu aslinda birkac olay sonucunda gerceklesebilir. `A` ve `B` isminde iki branch'imiz olsun. `B` branch'i `A` branch'ini kapsiyor ( $\text{branch}_B \supseteq \text{branch}_A$ ) onermesi asagidaki durumlarda gerceklesebilir:

- `B` ile `A` branch'i ayni commit'e isaret ediyordur.
- `B` branch'i `A` branch'inden olusturulmus ve `B` branch'i `A` branch'ine merge edilmeden once `A` branch'inin isaret ettigi commit degismemistir. Yani `A` branch'i, `B` branch'inin **atasidir**.
- `A` branch'i `B` branch'ine bir merge commit ile merge edilmistir.

Fakat burada bu sorguyu branch'ler ile degil de commit'ler ile ele almak daha dogru cikarimlara ulasmamiza yardimci olacaktir. Bizim `A` veya `B` branch'i olarak isimlendirdigimiz yapilar aslinda bahsi gecen anda bu branch'lerin baktigi commit'ler olarak dusunulmelidir. Aksi taktirde yanlis varsayimlarla yanlis sonuclara ulasabiliriz.

Branch terimini ortadan kaldirip yerine commit terimini kullanmaya basladigimiz zaman, **kapsamak** olarak isimlendirdigimiz durum aslinda basitce bir commit'in diger commit'in **atasi** olmasini ima etmektedir.

**X** ve **Y** hash'li iki commit'imiz olsun. **X commit**'inin parent commit grafini gezerek **Y commit**'ine ulasabiliyorsak **Y commit**'i **X commit**'inin atasidir diyebiliiriz.

Simdi uzerinde calistigimiz repository'mize donup bu sorguyu farkli commit ikilileri icin deneyelim.

-8<- "commit_graph_relation.md:git-log"

#### Ilk sorgumuz: Repository'deki ilk commit, mevcut commit'imizin atasi mi?

Repository'mizin mevcuttaki halinde bu sorgunun cevabi her zaman evet olacaktir. Ancak bunu bir komut ile dogrulayalim.

!!! note "Terminoloji"
    Bir git repository'sinde hicbir atasi olmayan commit'lere **root commit** adi verilir. Turkcede kok commit diye isimlendirebiliriz.

??? note "Birden cok **root commit**"
    Bir git repository'sinde birden cok **root commit** bulunmasi mumkundur. Bunu gerceklestirmenin yollarindan birisi **orhpan** bir branch olusturmaktir. Bunu checkout yaparken `--orphan` bayragi ile yeni bir branch olusturarak gerceklestirebiliriz.

    Daha sonra log'u `--all --max-parents=0` bayraklari sadece **root commit**'leri gosterecek sekilde ayarlayarak birden cok **root commit**'imizin oldugunu dogrulayabiliriz.
    -8<- "commit_graph_relation.md:orphan-branch"
    Simdi ise `git checkout dal-A` ile onceki branch'imize geri donelim.

!!! warning "`git log` icin `--all` bayragi"
    Sorgularimiz icin log'u filtrelerken `--all` bayragini kullanmamamiz gerekiyor, aksi taktirde mevcut commit grafindan ziyade butun repository'nin commit history'sini yazdiracagi icin yanlis sonuclara varmamiza sebep olacaktir.

-8<- "commit_graph_relation.md:sorgu-1"

!!! tip "Unix Bilgisi"
    `grep` Unix sistemlerde kurulu olarak gelen bir programdir. Bir dosyanin veya kendisine beslenen bir girdinin belli bir filtreye uyan satirlarini yazdirmaya yarar.
    
    `|` (**pipe**) operatoru ile bir onceki kommutun ciktisini bir sonraki komuta girdi olarak besleyebiliyor, diger bir deyisle **pipe**'leyebiliyoruz. `| grep "{{ commit_graph_relation.root_commit }}"` yaparak `git log` komutunun ciktisini `grep` programina girdi olarak besledik ve `grep` de bize sadece ve sadece `"{{ commit_graph_relation.root_commit }}"` kismini iceren satirlari cikardi.

Yukaridaki komut ile mevcut history grafimizi yazdirdik ve `grep` ile bu grafi filtreleyerek repository'deki ilk commit mevcut history'mizde var mi yok mu sorgusuna cevabimizi "evet" olarak bulduk.

#### Ikinci sorgumuz: `yeni-branch` branch'inin baktigi commit, su anki commit'imizin atasi mi?

-8<- "commit_graph_relation.md:sorgu-2"

`yeni-branch` isimli branch'i bir merge commit ile soyagicimiza baglamistik ve bunun sonucunda artik onun da mevcut commit'imizin bir atasi oldugunu gorebiliyoruz.

#### Son sorgumuz: `dal-B` branch'inin baktigi commit, su anki commit'imizin atasi mi?

Hatirlarsaniz `dal-B` branch'ine 2 yeni commit atip onu daha sonra **squash merge** ile `dal-A` branch'imize merge etmistik.

-8<- "commit_graph_relation.md:sorgu-3"

Yukaridaki komutun hicbir cikti vermemesiyle asikar oldugu uzere `dal-B` branch'i su anda `dal-A` branch'inin baktigi commit'in bir atasi olarak gorunmuyor. `dal-B` branch'ini merge etmis olmamiza ragmen, yaptigimiz merge islemi **squash merge** oldugu icin aslinda `dal-B` branch'ini `dal-A` branch'ine baglayan herhangi bir commit olusmamis oluyor. Squash merge ile birlikte aslinda `dal-A` branch'ine yalnizca bagimsiz yeni bir commit atmis oluyoruz.

Buradan yola cikarak ne zaman **squash merge** yapmak istedigimize dikkat etmekte fayda oldugunu soyleyebiliriz. Branch'ler veya commitler arasi soyagaci iliskisini korumak istiyorsak squash merge yapmaktan kacinmaliyiz.

!!! tip "Alternatif komutlar"
    Bu sekilde log'u kullanarak commit **soyagacini** sorgulamak yanlis bir yaklasim olmasa da, git'in bu amac icin kullanabilecegimiz farkli komutlari da mevcut.
    
    - `rev-list` belirtilen commit'in ulasabildigi butun commit hash'lerini listeler. `log` komutu insan tarafindan okunabilen bir komut iken `rev-list` script amaci ile kullanilan bir komuttur.
        
        !!! note "Terminoloji"
            Git komutlarindan bahsederken insan tarafindan okunabilmesi amaclanan komutlara **porcelain** sifati kullanilir. `git log` bir **porselen** komut iken `rev-list` bir **porselen** komut degildir.
        -8<- "commit_graph_relation.md:alternatif-komut-rev-list"
    
    - `merge-base` komutu `--is-ancestor` bayragi ile kullanildigi zaman bir commit digerinin atasidir onermesi dogru ise `0` kodu ile, yanlis ise `0`'dan farkli bir kod ile cikis yapar.
    -8<- "commit_graph_relation.md:alternatif-komut-merge-base-1"
    -8<- "commit_graph_relation.md:alternatif-komut-merge-base-2"