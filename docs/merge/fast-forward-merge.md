# Fast-Forward Merge

Bir branch'i digerine merge ettigimizde merge commit olustugundan ve bu commit'in birden cok parent commit'i oldugundan bahsetmistik. Fakat buna her zaman ihtiyacimiz olmayabilir. 

Ornegin `A` ve `B` isminde iki adet branch'imiz oldugunu varsayalim. `A` branch'i dogrudan `B` branch'inin ortak atasi olabilir. Bu durumlarda ekstra bir merge commit'i history'mizi kirleterek log'a bakmayi zorlastiracaktir. `B` branch'i zaten `A` branch'ini kapsadigi icin bu iki branch'i birbirine yeni bir commit ile baglamaya gercekten gerek var mi?

Git gibi bir arac kullanmanin bize sagladigi faydalardan birisi de yaptigimiz operasyonlarin sonucunu kendi icinde hesaplayarak sadelestirebilmesi, yani optimize edebilmesidir. Yukaridaki ornek durum icin aslinda merge yerine cok daha basit bir cozum mevcut. `A` branch'i zaten `B` branch'inin icinde bulundugu icin, yani diger bir deyisle `B` branchi `A` branch'ini kapsadigi icin, `B` branch'ini `A` branch'ine merge etmek yerine `A` branch'inin isaret ettigi commit'i `B` branch'inin isaret ettigi commit'e degistirerek yine istedigimiz ayni sonuca ulasabiliriz ve boylece fazladan bir merge commit olusturmaktan kacinmis oluruz. Bu durumu gorsellestirerek daha iyi aciklayabiliriz.

![image info](./images/fast-forward-merge-1.gif)

Gorselde de gorulen bu yontem git'in bize sagladigi kolayliklardan birisidir. Bu cesit yapilan merge operasyonlarina **fast-forward merge** adi verilmektedir. Merge operasyonunu calistirdiginizda git $\text{branch}_B \supseteq \text{branch}_A$ onermesini ispatlayabilir ise otomatik olarak **fast-forward merge** uygulamaktadir.

Bu davranisi uzerinde calistigimiz repository'mizde test edebiliriz. Oncelikle main branch'in ustune `dal-B` isminde yeni bir branch acalim ve bir commit atalim.

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

Log'dan da goruldugu uzere `dal-B` branch'i `main` branch'ini kapsiyor. Simdi ise `main` branch'ine gecerek `dal-B` branch'ini merge etmeyi deneyelim.

```bash
$ git checkout main
Switched to branch 'main'

$ git merge dal-B
Updating b979b40..bf6c603
Fast-forward
 test.txt | 1 +
 1 file changed, 1 insertion(+)
```

Merge komutunu calistirdiktan sonraki ciktida `Fast-forward` satiri bize **fast-forward merge** yapildigini gostermektedir. Simdi log'umuza bakalim.

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

Goruldugu uzere yeni bir merge commit'i olusturulmamis. `main` branch'inin baktigi commit `b979b40` hash'li commit'ten `bf6c603` hash'li commit'e degistirilmis durumda.

!!! tip "Fast-forward merge'den kacinmak"
    Bazi projelerde history'de bir yapi korunmak istenebiliyor. Bu durumlarda merge operasyonlarinda **fast-forward** yerine merge commit'i olusturma ihtiyaci olusabiliyor. Bu durumda merge komutuna `--no-ff` bayragi eklenerek git'in **fast-forward** yapmasini onleyebilirsiniz.
