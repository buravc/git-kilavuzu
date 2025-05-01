# Fast-Forward Merge

Bir branch'i diğerine merge ettiğimizde merge commit oluşturduğumuzdan ve bu commit'in birden çok parent commit'i olduğundan bahsetmiştik. Fakat buna her zaman ihtiyacımız olmayabilir. 

Örneğin `A` ve `B` isminde iki adet branch'imiz olduğunu varsayalım. `A` branch'i doğrudan `B` branch'inin ortak atası olabilir. Bu durumlarda ekstra bir merge commit'i ile history'mizi kirletmek log'a bakmayı zorlaştıracaktır. `B` branch'i zaten `A` branch'ini kapsadığı için bu iki branch'i birbirine yeni bir commit ile bağlamaya gerçekten gerek var mı?

Git gibi bir araç kullanmanın bize sağladığı faydalardan birisi de yaptığımız operasyonların sonucunu kendi içinde hesaplayarak sadeleştirebilmesi, yani optimize edebilmesidir. Yukarıdaki örnek durum için aslında merge yerine çok daha basit bir çözüm mevcut. `A` branch'i zaten `B` branch'inin içinde bulunduğu için, yani diğer bir deyişle `B` branch'i `A` branch'ini kapsadığı için, `B` branch'ini `A` branch'ine merge etmek yerine `A` branch'inin işaret ettiği commit'i `B` branch'inin işaret ettiği commit'e değiştirerek yine istediğimiz aynı sonuca ulaşabiliriz ve böylece fazladan bir merge commit'i oluşturmaktan kaçınmış oluruz. Bu durumu görselleştirerek daha iyi açıklayabiliriz.

![image info](./images/fast-forward-merge-1.gif)

Görselde de görülen bu yöntem Git'in bize sağladığı kolaylıklardan birisidir. Bu çeşit yapılan merge operasyonlarına **fast-forward merge** adı verilmektedir. Merge operasyonunu çalıştırdığınızda Git $\text{branch}_B \supseteq \text{branch}_A$ önermesini ispatlayabilir ise otomatik olarak **fast-forward merge** uygulamaktadır.

Bu davranışı üzerinde çalıştığımız repository'mizde test edebiliriz. Öncelikle main branch'inin üstüne `dal-B` isminde yeni bir branch açalım ve bir commit atalım.

-8<- "fast_forward_merge.md:git-commit"

Log'dan da görüldüğü üzere `dal-B` branch'i `main` branch'ini kapsıyor. Şimdi ise `main` branch'ine geçerek `dal-B` branch'ini merge etmeyi deneyelim.

-8<- "fast_forward_merge.md:git-merge"

Merge komutunu çalıştırdıktan sonraki çıktıda `Fast-forward` satırı bize **fast-forward merge** yapıldığını göstermektedir. Şimdi log'umuza bakalım.

-8<- "fast_forward_merge.md:git-log"

Görüldüğü üzere yeni bir merge commit'i oluşturulmamış. `main` branch'inin baktığı commit `{{ fast_forward_merge.main_hash_before_ff }}` hash'li commit'ten `{{ fast_forward_merge.main_hash_after_ff }}` hash'li commit'e değiştirilmiş durumda.

!!! tip "Fast-forward merge'den kaçınmak"
    Bazı projelerde history'de bir yapı korunmak istenebiliyor. Bu durumlarda merge operasyonlarında **fast-forward** yerine merge commit'i oluşturma ihtiyacı oluşabiliyor. Bu durumda merge komutuna `--no-ff` bayrağı eklenerek Git'in **fast-forward** yapmasını engelleyebilirsiniz.

