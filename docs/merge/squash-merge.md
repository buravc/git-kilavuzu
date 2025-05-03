Geçtiğimiz bölümler sonucunda 2 merge commit'li bir history'miz oluştu.

-8<- "squash_merge.md:git-log-1"

Fakat bu çok boyutlu veya çok parent'lı yapı bazen repository'i yönetmemizi zorlaştırabiliyor. Örneğin bazen repository'mizde `main` branch'inin tek boyutlu kalmasını isteyebiliriz. Böylece gelecekte `main` branch'in takip edilmesini ve yönetilmesinin kolaylaşmasını sağlamak istiyoruz. Fakat farklı bir branch açarak deneysel çalışmalar yapmaya ihtiyacımız da olabiliyor.

Kendimize `A` isminde yeni bir branch oluşturduğumuzu ve bunun üzerinde deneysel çalışmalar yapıp çok sayıda commit attığımızı varsayalım. Bu branch'te attığımız commit'lerin hepsi anlamlı commit'ler olmayabilir ve o commit'lerin çoğunun sadece o branch'te kalmasını istiyoruz. `main` branch'e `A` branch'ini merge etmek istiyoruz ama `A` branch'inde meydana gelen bütün geliştirme sürecinden ziyade sadece `A` branch'inin sonucunu almak istiyoruz. Böylece `main` branch'inin de dal yapısının tek boyutta kalmasını sağlamak istiyoruz.

Bu senaryoda gerçekleştirmek istediğimiz eylemi **squash merge** olarak adlandırabiliriz. Aslında yapmak istediğimiz şey `A` branch'indeki bütün commit'leri **sıkıştırıp** yeni bir commit olarak `main` branch'e eklemek olarak sadeleştirilebilir. Bunu gerçekleştirmek için merge esnasında `--squash` bayrağını kullanmamız yeterli olacaktır.

Örnek olarak `dal-A` ve `dal-B` branch'lerini ele alalım. `dal-B` branch'ine geçip 2 tane commit atalım. Bu commit'lerden sonra `dal-B` branch'ini `dal-A` branch'ine merge etmek isteyeceğiz.

-8<- "squash_merge.md:prepare-dal-b"

`dal-B` üzerinde 2 commit atarak `test.txt` dosyasına 2 değişiklik yaptık. Şimdi ise `dal-A` branch'ine geçerek **squash merge** yapmayı deneyelim.

-8<- "squash_merge.md:squash-merge"

`git status` komutunun çıktısından da anlaşılacağı üzere çalıştırdığımız `merge` otomatik olarak bir commit atmadı. Onun yerine `dal-B` branch'indeki değişiklikleri index'e ekledi. Bu durumda commit'i kendimiz elle tamamlamamız gerekiyor.

-8<- "squash_merge.md:git-commit-log"
-8<- "squash_merge.md:cat-test-txt"

Commit'i gerçekleştirdikten sonra log'dan da görebileceğimiz üzere aslında bir merge commit'i oluşmadı. Onun yerine sadece kendisinden önceki commit'e bakan yeni bir commit oluştu ve bu yeni commit ile birlikte `dal-B` branch'inde `test.txt` dosyasına yaptığımız değişiklikler artık `dal-A` branch'inde mevcut hale geldi.