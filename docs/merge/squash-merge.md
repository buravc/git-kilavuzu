Gectigimiz bolumler sonucunda 2 merge commit'li bir history'miz olustu.

-8<- "squash_merge.md:git-log-1"

Fakat bu cok boyutlu veya cok parent'li yapi bazen repository'i yonetmemizi zorlastirabiliyor. Ornegin bazen repository'mizde `main` branch'inin tek boyutlu kalmasini isteyebiliriz. Boylece gelecekte `main` branch'in takip edilmesini ve yonetilmesinin kolaylasmasini saglamak istiyoruz. Fakat farkli bir branch acarak deneysel calismalar yapmaya ihtiyacimiz da olabiliyor.

Kendimize `A` isminde yeni bir branch olusturdugumuzu ve bunun uzerinde deneysel calismalar yapip cok sayida commit attigimizi varsayalim. Bu branch'te attigimiz commitlerin hepsi anlamli commit'ler olmayabilir ve o commit'lerin cogunun sadece o branch'te kalmasini istiyoruz. `main` branch'e `A` branch'ini merge etmek istiyoruz ama `A` branch'inde meydana gelen butun gelistirme surecinden ziyade sadece `A` branch'inin sonucunu almak istiyoruz. Boylece `main` branch'inin de dal yapisinin tek boyutta kalmasini saglamak istiyoruz.

Bu senaryoda gerceklestirmek istedigimiz eylemi **squash merge** olarak adlandirabiliriz. Aslinda yapmak istedigimiz sey `A` branch'indeki butun commitleri **sikistirip** yeni bir commit olarak `main` branch'e eklemek olarak sadelestirilebilir. Bunu gerceklestirmek icin merge esnasinda `--squash` bayragini kullanmamiz yeterli olacaktir.

Ornek olarak `dal-A` ve `dal-B` branch'lerini ele alalim. `dal-B` branch'ine gecip 2 tane commit atalim. Bu commit'lerden sonra `dal-B` branch'ini `dal-A` branch'ine merge etmek isteyecegiz.

-8<- "squash_merge.md:prepare-dal-b"

`dal-B` uzerinde 2 commit atarak `test.txt` dosyasina 2 degisiklik yaptik. Simdi ise `dal-A` branch'ine gecerek **squash merge** yapmayi deneyelim.

-8<- "squash_merge.md:squash-merge"

`git status` komutunun ciktisindan da anlasilacagi uzere calistirdigimiz `merge` otomatik olarak bir commit atmadi. Onun yerine `dal-B` branch'indeki degisiklikleri index'e ekledi. Bu durumda commit'i kendimiz elle tamamlamamiz gerekiyor.

-8<- "squash_merge.md:git-commit-log"
-8<- "squash_merge.md:cat-test-txt"

Commit'i gerceklestirdikten sonra log'dan da gorebilecegimiz uzere aslinda bir merge commit'i olusmadi. Onun yerine sadece kendisinden onceki commit'e bakan yeni bir commit olustu ve bu yeni commit ile birlikte `dal-B` branch'inde `test.txt` dosyasina yaptigimiz degisiklikler artik `dal-A` branch'inde mevcut hale geldi.