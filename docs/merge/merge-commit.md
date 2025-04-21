# Branch Merge / Merge Commit

Git bize yaptigimiz degisiklikleri ayirmamiza, gruplamamiza, duzenlememize, geriye almamiza, yani kisaca yonetmemize olanak saglayan bir arac. Fakat bazen projemizde, veya repository'mizde geldigimiz noktada iki ayri degisikligi birlestirmeye ihtiyac duyabiliyoruz. Bu degisikliklerimizi yonetmek icin kullandigimiz arac, **git** ayni zamanda bu degisiklikleri bir arada toplamamiza, veya birlestirmemize de olanak sagliyor.

Yukariya ek olarak gectigimiz sayfalarda bir commit'in en az bir parent commit'i olmasi zorunda oldugundan bahsetmistik. Bunun uzerine `git commit` komutu ile yeni bir commit attigimiz zaman olusan commit'in bir parent commit'e baktigini ve bu parent commit'i ile olan iliskisini ortaya koymustuk. En az bir parent commit diyerek bir commit'in birden cok parent commit'e de ayni anda bakabildigini de ima ediyoruz. Eger ki `git commit` ile atilan commitler sadece 1 parent'e bakabiliyorsa, o halde birden cok parent'i olabilen baska bir commit atma yonteminin olmasi gerekiyor. Burada git'in henuz deginmedigimiz bir operasyonundan bahsetmeye baslayabiliriz.

Git bize iki veya daha fazla commit dalini, yani iki branch'i tek bir noktada toplamamiza `merge` komutu ile imkan taniyor. Bu sayede birbirinden ayrilmis iki branch'i tekrar bir araya getirebiliyorsunuz.

!!! note "Terminoloji"
    **Merge** Turkcede birlestirmek, bir araya karistirmak anlamina gelir. Git baglaminda da anlami degismez.

Bu `merge` operasyonunu onceki sayfalarda uzerinde calistigimiz repository'miz uzerinde gerceklestirelim. `main` branch'imize gecip repository'mizde yeni bir dosya olusturup commit atalim. Hemen ardindan da commit'imizin yaptigi degisikligi gosterelim. Bu degisikligi gostermek icin `git show` komutunu yeni olusan commit'in hash'i ile birlikte kullanacagiz.

```bash
$ git checkout main
Switched to branch 'main'

$ echo "Lorem ipsum" > test-2.txt

$ git add test-2.txt

$ git commit -m "test-2.txt dosyasini ekledim"
[main a26b42a] test-2.txt dosyasini ekledim
 1 file changed, 1 insertion(+)
 create mode 100644 test-2.txt

$ git show a26b42a
commit a26b42a072b0ac6a9d852c91c2c544642e0d5c2d
Author: <username> <email>
Date:   Mon Apr 21 12:06:38 2025 +0200

    test-2.txt dosyasini ekledim

diff --git a/test-2.txt b/test-2.txt
new file mode 100644
index 0000000..3be11c6
--- /dev/null
+++ b/test-2.txt
@@ -0,0 +1 @@
+Lorem ipsum
```

Simdi repository'mizin log'una bakalim. Bu sefer `--all` bayragini da komutumuza ekleyelim. Bu bayrak ile sadece mevcut branch'in degil butun repository'nin log'unu gormek istedigimizi belirtiyoruz.

```bash
$ git log --graph --parents --oneline --all
* a26b42a 419a640 (HEAD -> main) test-2.txt dosyasini ekledim
| * c973c9d 419a640 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
|/  
* 419a640 beddf6b Dosyaya Merhaba Dunya ekledim
* beddf6b Ilk commit
```

Buradan anlasilacagi uzere `419a640` commit'inden baslayarak dallanan 2 ayri degisiklik zincirimiz var. Biri `main` branch, digeri ise `yeni-branch` ismindeki branch. 

!!! note "Terminoloji"
    Bu noktada repository'mizde`419a640` commit'i `main` ve `yeni-branch` branch'lerinin **common ancestor**'u, yani ortak atasi oluyor.

`yeni-branch` ismindeki branch'i `main` branch'e birlestirerek aslinda o dalda yapilmis olan degisiklikleri, yani `main` branch'te bulunmayip `yeni-branch`'te bulunan commit'leri `main` branch'ine de almak istedigimizi varsayalim. Bu birbirinden farkli yonlere dallanmis iki branch'i bir araya getirmek icin `merge` komutunu kullanabiliriz.

!!! tip "Text editoru"
    Calistiracagimiz `merge` komutu bizden commit mesajini duzenlememizi isteyecek. Bu noktada git'in varsayilan olarak kullandigi `vi` modal editoru acilacaktir. Fakat bircogumuz buna asina olmadigi icin bu komutu calistirmadan once git'in kullanacagi text editorunu vscode olarak degistirmenizi tavsiye ederim. Bunu asagidaki komutu calistirarak saglayabilirsiniz.
    ```bash
    git config --global core.editor "code --wait"
    ```

```bash
$ git merge yeni-branch
Merge made by the 'ort' strategy.
 test.txt | 1 +
 1 file changed, 1 insertion(+)
```

Bunu calistirdiktan sonra karsiniza acilan text editoru kaydedip cikarak merge islemini tamamlayabilirsiniz. Simdi ise repository'mizin son haline bakalim.

```bash
$ git --no-pager log --graph --parents --oneline --all
*   b979b40 a26b42a c973c9d (HEAD -> main) Merge branch 'yeni-branch'
|\  
| * c973c9d 419a640 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | a26b42a 419a640 test-2.txt dosyasini ekledim
|/  
* 419a640 beddf6b Dosyaya Merhaba Dunya ekledim
* beddf6b Ilk commit
```

Buradan da asikar oldugu uzere `merge` komutu ile yeni bir commit olusturulmus durumda. `main` branch'i artik bu commit'e bakiyor. Bu commit'in hash'i `b979b40` iken, 1 degil **2 adet parent commit**'e, yani `a26b42a` ve `c973c9d` commitlerine baktigini gorebiliyoruz. Soldaki graf ile bu birlesme terminal ortamindaki karakterler ile gorsellestirilmis. Bu gorsellik bize daha karmasik repository'lerde yardimci olacak.

Peki bu merge commit'inin icinde ne var? Bunu yukarida kullandigimiz `git show` komutu ile gosterelim.

```bash
$ git show b979b40
commit b979b404898a2508b2812b3ca6b4b70d7e6f07f7 (HEAD -> main)
Merge: a26b42a c973c9d
Author: <username> <email>
Date:   Mon Apr 21 12:28:56 2025 +0200

    Merge branch 'yeni-branch'
```

Burada herhangi bir dosya degisikligi gozukmuyorken `Merge: a26b42a c973c9d` satiri gozumuze carpiyor. Bu commit aslinda icinde herhangi bir degisiklik barindirmiyor ve sadece 2 adet ayri commit'e isaret ediyor. Yani aslinda sadece bir yertutucu gorevi goruyor. Bu ozellikteki commit'lere **merge commit** adi verilmektedir.

!!! note "Merge commit'i de degisiklik barindirabilir"
    Ileride **conflict** terimine degindigimizde merge commit'lerinin de degisiklik barindirabildigini gorecegiz.

Buradan da anlasilacagi uzere bir branch'i digerine merge etmek aslinda commit'leri kopyalamiyor, birlestirmiyor, degistirmiyor. Bir branch'i digerine merge etmek aslinda commit graf'ina sadece bir dugum daha ekliyor.

!!! note "Terminoloji"
    `merge` komutu birden fazla branch'i ayni anda merge etmemize de olanak sagliyor. Bunun sonucunda olusan merge commit'inin 2'den fazla parent commit'i olabiliyor. Bu yontem ile yapilan merge islemlerine **octopus merge** deniliyor. Turkcelestirmek istersek ahtapot birlesimi diyebiliriz ama bu cok saglikli bir karsilik olmaz.

!!! tip "Eglenceli Bilgiler"
    - GitHub'un maskotu olan ahtapot kedi [Octocat](https://myoctocat.com), aslinda Octopus ismindeki ufak bir kelime oyunundan gelmektedir. Bu fikir Ingilizcede Octo ve Puss isimlerinin birlesiminden olusan Octopuss isimli bir stok gorselden ortaya cikmistir. [Kaynak](https://en.wikipedia.org/wiki/GitHub#Mascot)

    - Linux kernel gelistirmesi sirasinda olusan 66 parent'li bir merge commit'i hakkinda [bu yaziyi](https://www.destroyallsoftware.com/blog/2017/the-biggest-and-weirdest-commits-in-linux-kernel-git-history) okumanizi tavsiye ederim.