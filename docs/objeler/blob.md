Bir git repository'sindeki dosyalar `blob` adi verilen objeler ile saklanmaktadir. Bu blob'lar dosyalarin iceriklerini barindirirlar.

!!! note "Terminoloji"
    **Blob** ismi, **binary large object** kelimelerinin kisaltilmasiyla meydana gelen bir terimdir.

Ornegin repository'mizin `test.txt` isimli dosyasina karsilik gelen `blob` objesinin hash'ini commit'imizin isaret ettigi root tree'den bulalim. Daha sonra bu blob'u `cat-file` yardimi ile ekrana bastiralim.

-8<- "blob.md:find-and-print-test-txt-blob"

Buradan goruldugu uzere tree'miz bir blob'a isaret etmekte ve bu blob'u hash'ini kullanarak ekrana yazdirdigimiz zaman ise `test.txt` isimli dosyamizin icerigine ulasmaktayiz. Genellestirirsek:

- Blob'lar bir dosyanin kopyasini tutmaktadir.
- Blob'lar anonimdir.
- Blob'lara mekan niteligini tree'ler atfeder.
- Blob'lara dosya isimlerini tree'ler atfeder.
