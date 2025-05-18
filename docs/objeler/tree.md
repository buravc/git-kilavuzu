Git, bir repository'deki dizinlerin yapisini `tree` adi verilen objeler ile saklamaktadir. Tree objeleri ile repository'mizin dosya sistemi bilgisi, hangi dizinde hangi dizinlerin ve hangi dosyalarin oldugunu, bu dizin ve dosyalarin izin bilgileri bir arada saklanmaktadir.

!!! note "Terminoloji"
    Bir commit'in isaret ettigi `tree` objesine **root tree** adi verilir. **Root tree**'ler repository'mizin kok dizin yapisini barindirirlar.

Tree objesini daha iyi aciklayabilmek icin repository'mizde klasorler olusturup bu klasorlerin icinde dosyalar olusturup bir commit atalim.

-8<- "tree.md:create-sub-dirs"
-8<- "tree.md:tree-sub-dirs"

`cat-file` komutu yardimiyla mevcut commit'imizin isaret ettigi root tree'ye bakalim.

!!! note "`-p` Bayragi"
    Yazinin bu noktasindan itibaren `cat-file` komutunu `-p` bayragi ile kullanacagim. Aksi halde `tree` objeleri ekrana bozuk karakterler ile basilacaktir.

-8<- "tree.md:cat-file-tree-1"

Yukarida da goruldugu uzere mevcut commit'imizin isaret ettigi **root tree** objesi repository'mizde olusturdugumuz dosyalarimizi `blob` ismindeki obje tipi ve bu objelerin hash'leri ile isaret etmektedir.

!!! tip "Unix Bilgisi"
    Tree objemizin listeledigi `blob` objelerinin basinda yer alan `100644` sayisi Unix sistemlerde bir dosyanin tipini ve kimlerin bu dosyaya erisebildigini gosteren bir kodlama yontemidir. `100644` kodu bize dosyanin **calistirilamaz bir dosya** oldugunu ve bu dosyaya **sadece dosya sahibinin** yazma islemi yapabilecegini ifade etmektedir.

    `040000` ise bize bunun bir dizin oldugunu soylemektedir.

Burada dikkatimizi ceken bir baska unsur ise root tree'mizin icerdigi bir baska oge olan `alt-dizinim` ismindeki bir baska tree. Root tree'miz aslinda bir alt dizini bir tree objesi olarak isaret etmekte. Peki bu `alt-dizinim` tree'sinin ogeleri neler?

-8<- "tree.md:alt-dizinim-cat-file"

Bu alt dizinin tree objesi de ayni sekilde bir `blob` ve bir alt tree tipinde oge icermekte. Genellestirirsek:

- Her tree kendi baglamlarinda anonimlerdir. Hash'leri disinda bir kimlikleri yoktur.
- Bir tree bir baska tree'ye isaret ederken tree'nin hash'i ile birlikte bir isim atfedebilir.
- Her tree icinde barindirdigi `blob` ve `tree` lerin hash'lerini isaret eder.
- Bir commit'in isaret ettigi `tree` objesine **root tree** denir.
- **Root tree**'den baslayarak isaret edilen `blob` ve `tree` leri recursive bir sekilde gezersek commit'imizin atildigi esnadaki repository'nin dizin yapisini olusturabiliriz.