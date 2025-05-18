Git, bir repository'deki dizinlerin yapısını `tree` adı verilen objeler ile saklamaktadır. Tree objeleri ile repository'mizin dosya sistemi bilgisi, hangi dizinde hangi dizinlerin ve hangi dosyaların olduğunu, bu dizin ve dosyaların izin bilgileri bir arada saklanmaktadır.

!!! note "Terminoloji"
    Bir commit'in işaret ettiği `tree` objesine **root tree** adı verilir. **Root tree**'ler repository'mizin kök dizin yapısını barındırırlar.

Tree objesini daha iyi açıklayabilmek için repository'mizde klasörler oluşturup bu klasörlerin içinde dosyalar oluşturup bir commit atalım.

-8<- "tree.md:create-sub-dirs"
-8<- "tree.md:tree-sub-dirs"

`cat-file` komutu yardımıyla mevcut commit'imizin işaret ettiği root tree'ye bakalım.

!!! note "`-p` Bayrağı"
    Yazının bu noktasından itibaren `cat-file` komutunu `-p` bayrağı ile kullanacağım. Aksi halde `tree` objeleri ekrana bozuk karakterler ile basılacaktır.

-8<- "tree.md:cat-file-tree-1"

Yukarıda da görüldüğü üzere mevcut commit'imizin işaret ettiği **root tree** objesi repository'mizde oluşturduğumuz dosyalarımızı `blob` isminde bir obje tipi ve bu objelerin hash'leri ile işaret etmektedir.

!!! tip "Unix Bilgisi"
    Tree objemizin listelediği `blob` objelerinin başında yer alan `100644` sayısı Unix sistemlerde bir dosyanın tipini ve kimlerin bu dosyaya erişebildiğini gösteren bir kodlama yöntemidir. `100644` kodu bize dosyanın **çalıştırılamaz bir dosya** olduğunu ve bu dosyaya **sadece dosya sahibinin** yazma işlemi yapabileceğini ifade etmektedir.

    `040000` ise bize bunun bir dizin olduğunu söylemektedir.

Burada dikkatimizi çeken bir başka unsur ise root tree'mizin içerdiği bir başka öğe olan `alt-dizinim` isimli bir başka tree. Root tree'miz aslında bir alt dizini bir tree objesi olarak işaret etmekte. Peki bu `alt-dizinim` tree'sinin öğeleri neler?

-8<- "tree.md:alt-dizinim-cat-file"

Bu alt dizinin tree objesi de aynı şekilde bir `blob` ve bir alt tree tipi içermekte. Genelleştirirsek:

- Her tree kendi bağlamlarında anonimdir. Hash'leri dışında bir kimlikleri yoktur.
- Bir tree bir başka tree'ye işaret ederken tree'nin hash'i ile birlikte bir isim atfedebilir.
- Her tree içinde barındırdığı `blob` ve `tree`lerin hash'lerini işaret eder.
- Bir commit'in işaret ettiği `tree` objesine **root tree** denir.
- **Root tree**'den başlayarak işaret edilen `blob` ve `tree`leri recursive bir şekilde gezersek commit'imizin atıldığı esnadaki repository'nin dizin yapısını oluşturabiliriz.
