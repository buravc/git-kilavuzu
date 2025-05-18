Bir git repository'sindeki dosyalar `blob` adi verilen objeler ile saklanmaktadir. Bu blob'lar dosyalarin iceriklerini barindirirlar.

!!! note "Terminoloji"
    **Blob** ismi, **binary large object** kelimelerinin kisaltilmasiyla meydana gelen bir terimdir.

Ornegin repository'mizin `test.txt` isimli dosyasina karsilik gelen `blob` objesinin hash'ini commit'imizin isaret ettigi root tree'den bulalim. Daha sonra bu blob'u `cat-file` yardimi ile ekrana bastiralim.

-8<- "blob.md:find-and-print-test-txt-blob"

Buradan goruldugu uzere tree'miz bir blob'a isaret etmekte ve bu blob'u hash'ini kullanarak ekrana yazdirdigimiz zaman ise `test.txt` isimli dosyamizin icerigine ulasmaktayiz. Yani her blob, bir dosya icerigini barindirmakta. Burada bir blob bir dosyaya esittir gibi bir cikarima ulasabilsek de bu cikarim tam olarak dogru olmayacaktir. Blob'lar icin bir dosya kavrami yoktur. Agnostik objelerdir. Sadece bir dosyanin icerigini barindirirlar.

Her git objesinde oldugu gibi blob'larin hash'leri de blob'un icerecegi bilgiler hesaba katilarak hesaplanir. Bir dosyanin icerisinde degisiklik yaptiginiz zaman bu degisiklik sonucunda olusan yeni dosya icerigi hesaba katilarak bir hash uretilmesi gerekir. Ancak icerigin degismesiyle birlikte uretilecek olan bu hash da degisecegi icin yeni bir blob olusturulmasi gerekmektedir. `git add` komutu ile bir dosyada yaptigimiz degisikligi git'in index'ine ekledigimiz zaman yeni bir hash hesaplanarak yeni bir blob olusturulmasi gerekmektedir. Diger bir deyis ile bir dosyada yapip kayit altina aldiginiz her degisiklik sonucunda o dosya icin yeni bir blob olusturulmaktadir.

Ornek olarak `test.txt` isimli dosyamizin meydana getirdigi blob'un hash'ini elle hesaplayalim.

-8<- "blob.md:manual-hash"

Bunun yerine git'in `hash-object` komutunu kullanarak da ayni sonuca ulasabiliriz.

-8<- "blob.md:git-hash"

Blob hakkinda bildiklerimizi genellestirirsek:

- Blob'lar bir dosyanin o andaki kopyasini tutmaktadir.
- Blob'larin kimlikleri hash'leridir.
- Bir dosya iceriginde kayit edilen her degisiklik yeni bir blob olusturur.
- Blob'lar anonimdir.
- Blob'lara mekan niteligini tree'ler atfeder.
- Blob'lara dosya isimlerini tree'ler atfeder.