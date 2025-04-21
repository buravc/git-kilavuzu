# Fast-Forward Merge

Bir branch'i diğerine merge ettiğimizde merge commit oluşturduğumuzdan ve bu commit'in birden çok parent commit'i olduğundan bahsetmiştik. Fakat buna her zaman ihtiyacımız olmayabilir. 

Örneğin `A` ve `B` isminde iki adet branch'imiz olduğunu varsayalım. `A` branch'i doğrudan `B` branch'inin ortak atası olabilir. Bu durumlarda ekstra bir merge commit'i history'mizi kirleterek log'a bakmayı zorlaştıracaktır. `B` branch'i zaten `A` branch'ini kapsadığı için bu iki branch'i birbirine yeni bir commit ile bağlamaya gerçekten gerek var mı?

Git gibi bir araç kullanmanın bize sağladığı faydalardan birisi de yaptığımız operasyonların sonucunu kendi içinde hesaplayarak sadeleştirebilmesi, yani optimize edebilmesidir. Yukarıdaki örnek durum için aslında merge yerine çok daha basit bir çözüm mevcut. `A` branch'i zaten `B` branch'inin içinde bulunduğu için, yani diğer bir deyişle `B` branch'i `A` branch'ini kapsadığı için, `B` branch'ini `A` branch'ine merge etmek yerine `A` branch'inin işaret ettiği commit'i `B` branch'inin işaret ettiği commit'e değiştirerek yine istediğimiz aynı sonuca ulaşabiliriz ve böylece fazladan bir merge commit'i oluşturmaktan kaçınmış oluruz. Bu durumu görselleştirerek daha iyi açıklayabiliriz.

![image info](./images/fast-forward-merge-1.gif)

Görselde de görülen bu yöntem Git'in bize sağladığı kolaylıklardan birisidir. Bu çeşit yapılan merge operasyonlarına **fast-forward merge** adı verilmektedir. Merge operasyonunu çalıştırdığınızda Git $\text{branch}_B \supseteq \text{branch}_A$ önermesini ispatlayabilir ise otomatik olarak **fast-forward merge** uygulamaktadır.

Bu davranışı üzerinde çalıştığımız repository'mizde test edebiliriz. Öncelikle main branch'inin üstüne `dal-B` isminde yeni bir branch açalım ve bir commit atalım.

```bash
$ git checkout -b "dal-B"
Switched to a new branch 'dal-B'

$ echo "dal B icin degisiklik" >> test.txt

$ git add test.txt

$ git commit -m "dal-B icin degisiklik yaptim"
[dal-B bf6c603] dal-B icin degisiklik yaptim
 1 file changed, 1 insertion(+)

$ git log --graph --all --oneline             
* bf6c603 (HEAD -> dal-B) dal-B icin degisiklik yaptim
*   b979b40 (main) Merge branch 'yeni-branch'
|\  
| * c973c9d (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | a26b42a test-2.txt dosyasini ekledim
|/  
* 419a640 Dosyaya Merhaba Dunya ekledim
* beddf6b Ilk commit
```

Log'dan da görüldüğü üzere `dal-B` branch'i `main` branch'ini kapsıyor. Şimdi ise `main` branch'ine geçerek `dal-B` branch'ini merge etmeyi deneyelim.

```bash
$ git checkout main
Switched to branch 'main'

$ git merge dal-B
Updating b979b40..bf6c603
Fast-forward
 test.txt | 1 +
 1 file changed, 1 insertion(+)
```

Merge komutunu çalıştırdıktan sonraki çıktıda `Fast-forward` satırı bize **fast-forward merge** yapıldığını göstermektedir. Şimdi log'umuza bakalım.

```bash
$ git log --graph --all --oneline
* bf6c603 (HEAD -> main, dal-B) dal-B icin degisiklik yaptim
*   b979b40 Merge branch 'yeni-branch'
|\  
| * c973c9d (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | a26b42a test-2.txt dosyasini ekledim
|/  
* 419a640 Dosyaya Merhaba Dunya ekledim
* beddf6b Ilk commit
```

Görüldüğü üzere yeni bir merge commit'i oluşturulmamış. `main` branch'inin baktığı commit `b979b40` hash'li commit'ten `bf6c603` hash'li commit'e değiştirilmiş durumda.

!!! tip "Fast-forward merge'den kaçınmak"
    Bazı projelerde history'de bir yapı korunmak istenebiliyor. Bu durumlarda merge operasyonlarında **fast-forward** yerine merge commit'i oluşturma ihtiyacı oluşabiliyor. Bu durumda merge komutuna `--no-ff` bayrağı eklenerek Git'in **fast-forward** yapmasını engelleyebilirsiniz.

