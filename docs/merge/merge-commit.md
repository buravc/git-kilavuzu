# Branch Merge / Merge Commit

Git bize yaptığımız değişiklikleri ayırmamıza, gruplamamıza, düzenlememize, geriye almamıza, yani kısaca yönetmemize olanak sağlayan bir araç. Fakat bazen projemizde, veya repository'mizde geldiğimiz noktada iki ayrı değişikliği birleştirmeye ihtiyaç duyabiliyoruz. Bu değişikliklerimizi yönetmek için kullandığımız araç, **git** aynı zamanda bu değişiklikleri bir arada toplamamıza, veya birleştirmemize de olanak sağlıyor.

Yukarıya ek olarak geçtiğimiz sayfalarda bir commit'in en az bir parent commit'i olması gerektiğinden bahsetmiştik. Bunun üzerine `git commit` komutu ile yeni bir commit attığımız zaman oluşan commit'in bir parent commit'e baktığını ve bu parent commit'i ile olan ilişkisini ortaya koymuştuk. En az bir parent commit diyerek bir commit'in birden çok parent commit'e de aynı anda bakabildiğini de ima ediyoruz. Eğer ki `git commit` ile atılan commitler sadece 1 parent'e bakabiliyorsa, o halde birden çok parent'ı olabilen başka bir commit atma yönteminin olması gerekiyor. Burada git'in henüz değinmediğimiz bir operasyonundan bahsetmeye başlayabiliriz.

Git bize iki veya daha fazla commit dalını, yani iki branch'i tek bir noktada toplamamıza `merge` komutu ile imkan tanıyor. Bu sayede birbirinden ayrılmış iki branch'i tekrar bir araya getirebiliyorsunuz.

!!! note "Terminoloji"
    **Merge** Türkçede birleştirmek, bir araya karıştırmak anlamına gelir. Git bağlamında da anlamı değişmez.

Bu `merge` operasyonunu önceki sayfalarda üzerinde çalıştığımız repository'miz üzerinde gerçekleştirelim. `main` branch'imize geçip repository'mizde yeni bir dosya oluşturup commit atalım. Hemen ardından da commit'imizin yaptığı değişikliği gösterelim. Bu değişikliği göstermek için `git show` komutunu yeni oluşan commit'in hash'i ile birlikte kullanacağız.

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

Şimdi repository'mizin log'una bakalım. Bu sefer `--all` bayrağını da komutumuza ekleyelim. Bu bayrak ile sadece mevcut branch'in değil bütün repository'nin log'unu görmek istiyoruz.

```bash
$ git log --graph --parents --oneline --all
* a26b42a 419a640 (HEAD -> main) test-2.txt dosyasini ekledim
| * c973c9d 419a640 (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
|/  
* 419a640 beddf6b Dosyaya Merhaba Dunya ekledim
* beddf6b Ilk commit
```

Buradan anlaşılacağı üzere `419a640` commit'inden başlayarak dallanan 2 ayrı değişiklik zincirimiz var. Biri `main` branch, diğeri ise `yeni-branch` ismindeki branch.

!!! note "Terminoloji"
    Bu noktada repository'mizde `419a640` commit'i `main` ve `yeni-branch` branch'lerinin **common ancestor**'u, yani ortak atası oluyor.

`yeni-branch` ismindeki branch'i `main` branch'e birleştirerek aslında o dalda yapılmış olan değişiklikleri, yani `main` branch'te bulunmayıp `yeni-branch`'te bulunan commit'leri `main` branch'ine de almak istediğimizi varsayalım. Bu birbirinden farklı yönlere dallanmış iki branch'i bir araya getirmek için `merge` komutunu kullanabiliriz.

!!! tip "Text editoru"
    Çalıştıracağımız `merge` komutu bizden commit mesajını düzenlememizi isteyecek. Bu noktada git'in varsayılan olarak kullandığı `vi` modal editoru açılacaktır. Fakat birçoğumuz buna aşina olmadığı için bu komutu çalıştırmadan önce git'in kullanacağı text editorunu `vscode` veya `idea` olarak değiştirmenizi tavsiye ederim. Bunu aşağıdaki komutlardan birini çalıştırarak sağlayabilirsiniz.
    ```bash
    $ git config --global core.editor "code --wait" # vscode icin
    $ git config --global core.editor "idea --wait" # JetBrains IntelliJ icin
    ```

!!! warning "Merge Branch'ları"
    Burada `yeni-branch` isimli branch'i `main` isimli branch'e merge ediyoruz. Eğer ki merge başarılı olursa `main` branch'inin baktığı commit güncellenirken `yeni-branch` isimli branch'de hiçbir değişiklik meydana gelmeyecektir.

```bash
$ git merge yeni-branch
Merge made by the 'ort' strategy.
 test.txt | 1 +
 1 file changed, 1 insertion(+)
```

Bunu çalıştırdıktan sonra karşınıza açılan text editoru kaydedip çıkarak merge işlemini tamamlayabilirsiniz. Şimdi ise repository'mizin son haline bakalım.

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

Buradan da aşikar olduğu üzere `merge` komutu ile yeni bir commit oluşturulmuş durumda. `main` branch'i artık bu commit'e bakıyor. Bu commit'in hash'i `b979b40` iken, 1 değil **2 adet parent commit**'e, yani `a26b42a` ve `c973c9d` commit'lerine baktığını görebiliyoruz. Soldaki grafik ile bu birleşme terminal ortamındaki karakterler ile görselleştirilmiş. Bu görsellik bize daha karmaşık repository'lerde yardımcı olacak.

Peki bu merge commit'inin içinde ne var? Bunu yukarıda kullandığımız `git show` komutu ile gösterelim.

```bash
$ git show b979b40
commit b979b404898a2508b2812b3ca6b4b70d7e6f07f7 (HEAD -> main)
Merge: a26b42a c973c9d
Author: <username> <email>
Date:   Mon Apr 21 12:28:56 2025 +0200

    Merge branch 'yeni-branch'
```

Burada herhangi bir dosya değişikliği gözükmüyor iken `Merge: a26b42a c973c9d` satırı gözümüze çarpıyor. Bu commit aslında içinde herhangi bir değişiklik barındırmıyor ve sadece 2 adet ayrı commit'e işaret ediyor. Yani aslında sadece bir yertutucu görevi görüyor. Bu özellikteki commit'lere **merge commit** adı verilmektedir.

!!! note "Merge commit'i de değişiklik barındırabilir"
    İleride **conflict** terimine değindiğimizde **merge commit**'lerinin de değişiklik barındırabildiğini göreceğiz.

Buradan da anlaşılacağı üzere bir branch'i diğerine merge etmek aslında commit'leri kopyalamıyor, birleştirmiyor, değiştirmiyor. Bir branch'i diğerine merge etmek aslında commit graf'ına sadece bir düğüm daha ekliyor.

!!! note "Terminoloji"
    `merge` komutu birden fazla branch'i aynı anda merge etmemize de olanak sağlıyor. Bunun sonucunda oluşan merge commit'inin 2'den fazla parent commit'i olabiliyor. Bu yöntem ile yapılan merge işlemlerine **octopus merge** deniliyor. Türkçeleştirmek istersek ahtapot birleşimi diyebiliriz ama bu çok sağlıklı bir karşılık olmaz.

!!! tip "Eğlenceli Bilgiler"
    - GitHub'un maskotu olan ahtapot kedi [Octocat](https://myoctocat.com), aslında Octopus ismindeki ufak bir kelime oyunundan gelmektedir. Bu fikir İngilizcede Octo ve Puss isimlerinin birleşiminden oluşan Octopuss isimli bir stok görselden ortaya çıkmıştır. [Kaynak](https://en.wikipedia.org/wiki/GitHub#Mascot)

    - Linux kernel geliştirmesi sırasında oluşan 66 parent'li bir merge commit'i hakkında [bu yazıyı](https://www.destroyallsoftware.com/blog/2017/the-biggest-and-weirdest-commits-in-linux-kernel-git-history) okumanızı tavsiye ederim.
