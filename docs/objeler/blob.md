Bir git repository'sindeki dosyalar `blob` adı verilen objeler ile saklanmaktadır. Bu blob'lar dosyaların içeriklerini barındırırlar.

!!! note "Terminoloji"
    **Blob** ismi, **binary large object** kelimelerinin kısaltılmasından meydana gelen bir terimdir.

Örneğin repository'mizin `test.txt` isimli dosyasına karşılık gelen `blob` objesinin hash'ini commit'imizin işaret ettiği root tree'den bulalım. Daha sonra bu blob'u `cat-file` yardımı ile ekrana bastıralım.

-8<- "blob.md:find-and-print-test-txt-blob"

Buradan görüldüğü üzere tree'miz bir blob'a işaret etmekte ve bu blob'un hash'ini kullanarak ekrana yazdırdığımız zaman ise `test.txt` isimli dosyamızın içeriğine ulaşmaktayız. Yani her blob, bir dosya içeriğini barındırmaktadır. Burada bir blob bir dosyaya eşittir gibi bir çıkarıma ulaşabilsek de bu çıkarım tam olarak doğru olmayacaktır. Blob'lar için bir dosya kavramı yoktur. Agnostik objelerdir. Sadece bir dosyanın içeriğini barındırırlar.

Her git objesinde olduğu gibi blob'ların hash'leri de blob'un içereceği bilgiler hesaba katılarak hesaplanır. Bir dosyanın içerisinde değişiklik yaptığınız zaman bu değişiklik sonucunda oluşan yeni dosya içeriği hesaba katılarak bir hash üretilmesi gerekir. Ancak içeriğin değişmesiyle birlikte üretilecek olan bu hash da değişeceği için yeni bir blob oluşturulması gerekmektedir. `git add` komutu ile bir dosyada yaptığımız değişikliği git'in index'ine eklediğimiz zaman yeni bir hash hesaplanarak yeni bir blob oluşturulması gerekmektedir. Diğer bir deyişle bir dosyada yapıp kayıt altına aldığınız her değişiklik sonucunda o dosya için yeni bir blob oluşturulmaktadır.

Örnek olarak `test.txt` isimli dosyamızın meydana getirdiği blob'un hash'ini elle hesaplayalım.

-8<- "blob.md:manual-hash"

!!! tip "Unix Bilgisi"
    Burada dosyanın boyutunu hesaplamak için dosyayı `cat` ile okuyarak çıktısını `wc` komutuna yönlendirdik. `wc` komutunu `-c` bayrağı ile kullanarak girdinin kaç bayt olduğunu çıkarttık. Ancak `wc` komutunun çıktısında fazladan boşluk karakteri olduğu için `tr -d ' '` ile bu karakterleri sildirdik. Aksi taktirde bu fazladan boşluk karakterleri hesaplayacağımız hash'i etkileyerek farklı bir sonuç çıkaracaktı.

Bunun yerine git'in `hash-object` komutunu kullanarak da aynı sonuca ulaşabiliriz.

-8<- "blob.md:git-hash"

Blob hakkında bildiklerimizi genelleştirirsek:

- Blob'lar bir dosyanın o andaki kopyasını tutmaktadır.
- Blob'ların kimlikleri hash'leridir.
- Bir dosya içeriğinde kayıt edilen her değişiklik yeni bir blob oluşturur.
- Blob'lar anonimdir.
- Blob'lara mekan niteliğini tree'ler atfeder.
- Blob'lara dosya isimlerini tree'ler atfeder.
