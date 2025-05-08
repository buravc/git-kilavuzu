Önceki bölümlerde fast-forward merge'ye değinirken bahsettiğimiz önemli bir durum vardı. Bir branch diğer branch'i kapsıyor mu? Bu sorgunun bizim için önemi fast-forward merge bölümünde öne çıkmıştı. Fakat bu sorgunun ima ettiklerinin ayrı bir bölümde değinilmeyi gerektirdiğini düşünüyorum.

!!! note "Mental Model"
    Bu konuda git'i mental olarak modelleme biçimimizi tekrar gözden geçirmemizde fayda olacaktır. Bir branch bir commit'e işaret eden bir işaretçidir. Diğer bir deyişle **bir branch aynı anda birden çok commit'e değil, yalnızca tek bir commit'e işaret eder.**

    Bir commit ise bir commit grafının bir parçasıdır ve kendisinden önceki commit'e veya commit'lere *parent* ilişkisiyle bağlıdır.

Bir branch'in diğerini kapsıyor olması durumu aslında birkaç olay sonucunda gerçekleşebilir. `A` ve `B` isminde iki branch'imiz olsun. `B` branch'i `A` branch'ini kapsıyor ( $\text{branch}_B \supseteq \text{branch}_A$ ) önermesi aşağıdaki durumlarda gerçekleşebilir:

- `B` ile `A` branch'i aynı commit'e işaret ediyordur.
- `B` branch'i `A` branch'inden oluşturulmuş ve `B` branch'i `A` branch'ine merge edilmeden önce `A` branch'inin işaret ettiği commit değişmemiştir. Yani `A` branch'i, `B` branch'inin **atasıdır**.
- `A` branch'i `B` branch'ine bir merge commit ile merge edilmiştir.

Fakat burada bu sorguyu branch'ler ile değil de commit'ler ile ele almak daha doğru çıkarımlara ulaşmamıza yardımcı olacaktır. Bizim `A` veya `B` branch'i olarak isimlendirdiğimiz yapılar aslında bahsi geçen anda bu branch'lerin baktığı commit'ler olarak düşünülmelidir. Aksi takdirde yanlış varsayımlarla yanlış sonuçlara ulaşabiliriz.

Branch terimini ortadan kaldırıp yerine commit terimini kullanmaya başladığımız zaman, **kapsamak** olarak isimlendirdiğimiz durum aslında basitçe bir commit'in diğer commit'in **atası** olmasını ima etmektedir.

**X** ve **Y** hash'li iki commit'imiz olsun. **X commit**'inin parent commit grafını gezerek **Y commit**'ine ulaşabiliyorsak **Y commit**'i **X commit**'inin atasıdır diyebiliriz.

Şimdi üzerinde çalıştığımız repository'mize dönüp bu sorguyu farklı commit ikilileri için deneyelim.

-8<- "commit_graph_relation.md:git-log"

#### Sorgular
##### Repository'deki ilk commit, mevcut commit'imizin atası mı?

Repository'mizin mevcuttaki halinde bu sorgunun cevabı her zaman evet olacaktır. Ancak bunu bir komut ile doğrulayalım.

!!! note "Terminoloji"
    Bir git repository'sinde hiçbir atası olmayan commit'lere **root commit** adı verilir. Türkçede kök commit diye isimlendirebiliriz.

??? note "Birden çok **root commit**"  
    Bir git repository'sinde birden çok **root commit** bulunması mümkündür. Bunu gerçekleştirmenin yollarından birisi **orphan** bir branch oluşturmaktır. Bunu checkout yaparken `--orphan` bayrağı ile yeni bir branch oluşturarak gerçekleştirebiliriz.

    Daha sonra log'u `--all --max-parents=0` bayrakları ile sadece **root commit**'leri gösterecek şekilde ayarlayarak birden çok **root commit**'imizin olduğunu doğrulayabiliriz.
    -8<- "commit_graph_relation.md:orphan-branch"
    Şimdi ise `git checkout dal-A` ile önceki branch'imize geri dönelim.

!!! warning "`git log` için `--all` bayrağı"  
    Sorgularımız için log'u filtrelerken `--all` bayrağını kullanmamamız gerekiyor, aksi takdirde mevcut commit grafından ziyade bütün repository'nin commit history'sini yazdıracağı için yanlış sonuçlara varmamıza sebep olacaktır.

-8<- "commit_graph_relation.md:sorgu-1"

!!! tip "Unix Bilgisi"
    `grep` Unix sistemlerde kurulu olarak gelen bir programdır. Bir dosyanın veya kendisine beslenen bir girdinin belli bir filtreye uyan satırlarını yazdırmaya yarar.

    `|` (**pipe**) operatörü ile bir önceki komutun çıktısını bir sonraki komuta girdi olarak besleyebiliyor, diğer bir deyişle **pipe**'leyebiliyoruz. `| grep "{{ commit_graph_relation.root_commit }}"` yaparak `git log` komutunun çıktısını `grep` programına girdi olarak besledik ve `grep` de bize sadece ve sadece `"{{ commit_graph_relation.root_commit }}"` kısmını içeren satırları çıkardı.

Yukarıdaki komut ile mevcut history grafımızı yazdırdık ve `grep` ile bu grafı filtreleyerek repository'deki ilk commit mevcut history'mizde var mı yok mu sorgusuna cevabımızı "evet" olarak bulduk.

##### `yeni-branch` isimli branch'in baktığı commit, şu anki commit'imizin atası mı?

-8<- "commit_graph_relation.md:sorgu-2"

`yeni-branch` isimli branch'i bir merge commit ile commit history'mize, diğer bir deyişle **soyağacımıza** bağlamıştık ve bunun sonucunda artık onun da mevcut commit'imizin bir atası olduğunu görebiliyoruz.

##### `dal-B` branch'inin baktığı commit, şu anki commit'imizin atası mı?

Hatırlarsanız `dal-B` branch'ine 2 yeni commit atıp onu daha sonra **squash merge** ile `dal-A` branch'imize merge etmiştik.

-8<- "commit_graph_relation.md:sorgu-3"

Yukarıdaki komutun hiçbir çıktısı vermemesiyle aşikar olduğu üzere `dal-B` branch'i şu anda `dal-A` branch'inin baktığı commit'in bir atası olarak görünmüyor. `dal-B` branch'ini merge etmiş olmamıza rağmen, yaptığımız merge işlemi **squash merge** olduğu için aslında `dal-B` branch'ini `dal-A` branch'ine bağlayan herhangi bir commit oluşmamış oluyor. Squash merge ile birlikte aslında `dal-A` branch'ine yalnızca bağımsız yeni bir commit atmış oluyoruz.

Buradan yola çıkarak ne zaman **squash merge** yapmak istediğimize dikkat etmekte fayda olduğunu söyleyebiliriz. Branch'ler veya commitler arası soyağacı ilişkisini korumak istiyorsak squash merge yapmaktan kaçınmalıyız.

!!! tip "Alternatif komutlar"
    Bu şekilde log'u kullanarak commit **soyağacını** sorgulamak yanlış bir yaklaşım olmasa da, git'in bu amaç için kullanabileceğimiz farklı komutları da mevcut.

    - `rev-list` belirtilen commit'in ulaşabildiği bütün commit hash'lerini listeler. `log` komutu insan tarafından okunabilen bir komut iken `rev-list` script amacıyla kullanılan bir komuttur.

        !!! note "Terminoloji"
            Git komutlarından bahsederken insan tarafından okunabilmesi amaçlanan komutlara **porcelain** sıfatı kullanılır. `git log` bir **porselen** komut iken `rev-list` bir **porselen** komut değildir.
        -8<- "commit_graph_relation.md:alternatif-komut-rev-list"

    - `merge-base` komutu `--is-ancestor` bayrağı ile kullanıldığı zaman bir commit diğerinin atasıdir önermesi doğru ise `0` kodu ile, yanlış ise `0`'dan farklı bir kod ile çıkış yapar.
    -8<- "commit_graph_relation.md:alternatif-komut-merge-base-1"
    -8<- "commit_graph_relation.md:alternatif-komut-merge-base-2"
