# Branch Merge / Merge Commit

Git bize yaptığımız değişiklikleri ayırmamıza, gruplamamıza, düzenlememize, geriye almamıza, yani kısaca yönetmemize olanak sağlayan bir araç. Fakat bazen projemizde, veya repository'mizde geldiğimiz noktada iki ayrı değişikliği birleştirmeye ihtiyaç duyabiliyoruz. Bu değişikliklerimizi yönetmek için kullandığımız araç, **git** aynı zamanda bu değişiklikleri bir arada toplamamıza, veya birleştirmemize de olanak sağlıyor.

Yukarıya ek olarak geçtiğimiz sayfalarda bir commit'in en az bir parent commit'i olması gerektiğinden bahsetmiştik. Bunun üzerine `git commit` komutu ile yeni bir commit attığımız zaman oluşan commit'in bir parent commit'e baktığını ve bu parent commit'i ile olan ilişkisini ortaya koymuştuk. En az bir parent commit diyerek bir commit'in birden çok parent commit'e de aynı anda bakabildiğini de ima ediyoruz. Eğer ki `git commit` ile atılan commitler sadece 1 parent'e bakabiliyorsa, o halde birden çok parent'ı olabilen başka bir commit atma yönteminin olması gerekiyor. Burada git'in henüz değinmediğimiz bir operasyonundan bahsetmeye başlayabiliriz.

Git bize iki veya daha fazla commit dalını, yani iki branch'i tek bir noktada toplamamıza `merge` komutu ile imkan tanıyor. Bu sayede birbirinden ayrılmış iki branch'i tekrar bir araya getirebiliyorsunuz.

!!! note "Terminoloji"
    **Merge** Türkçede birleştirmek, bir araya karıştırmak anlamına gelir. Git bağlamında da anlamı değişmez.

Bu `merge` operasyonunu önceki sayfalarda üzerinde çalıştığımız repository'miz üzerinde gerçekleştirelim. `main` branch'imize geçip repository'mizde yeni bir dosya oluşturup commit atalım. Hemen ardından da commit'imizin yaptığı değişikliği gösterelim. Bu değişikliği göstermek için `git show` komutunu yeni oluşan commit'in hash'i ile birlikte kullanacağız.

-8<- "merge_commit.md:git-commit-main"

Şimdi repository'mizin log'una bakalım. Bu sefer `--all` bayrağını da komutumuza ekleyelim. Bu bayrak ile sadece mevcut branch'in değil bütün repository'nin log'unu görebiliriz.

-8<- "merge_commit.md:git-log-1"

Buradan anlaşılacağı üzere `{{ merge_commit.common_ancestor_commit_hash }}` commit'inden başlayarak dallanan 2 ayrı değişiklik zincirimiz var. Biri `main` branch, diğeri ise `yeni-branch` ismindeki branch.

!!! note "Terminoloji"
    Bu noktada repository'mizde `{{ merge_commit.common_ancestor_commit_hash }}` commit'i `main` ve `yeni-branch` branch'lerinin **common ancestor**'u, yani ortak atası oluyor.

`yeni-branch` ismindeki branch'i `main` branch'e birleştirerek aslında o dalda yapılmış olan değişiklikleri, yani `main` branch'te bulunmayıp `yeni-branch`'te bulunan commit'leri `main` branch'ine de almak istediğimizi varsayalım. Bu birbirinden farklı yönlere dallanmış iki branch'i bir araya getirmek için `merge` komutunu kullanabiliriz.

!!! tip "Text editoru"
    Çalıştıracağımız `merge` komutu bizden commit mesajını düzenlememizi isteyecek. Bu noktada git'in varsayılan olarak kullandığı `vi` isimli modal text editor açılacaktır. Fakat birçoğumuz buna aşina olmadığı için, bu komutu çalıştırmadan önce sizin git'in kullanacağı text editorunu `vscode` veya `idea` olarak değiştirmenizi tavsiye ederim. Bunu aşağıdaki komutlardan birini çalıştırarak sağlayabilirsiniz.
    ```bash
    $ git config --global core.editor "code --wait" # vscode icin
    $ git config --global core.editor "idea --wait" # JetBrains IntelliJ icin
    ```

!!! warning "Merge Branch'ları"
    Burada `yeni-branch` isimli branch'i `main` isimli branch'e merge ediyoruz. Eğer ki merge başarılı olursa `main` branch'inin baktığı commit güncellenirken `yeni-branch` isimli branch'de hiçbir değişiklik meydana gelmeyecektir.

-8<- "merge_commit.md:git-merge-yeni-branch"

Bunu çalıştırdıktan sonra karşınıza açılan text editoru kaydedip çıkarak merge işlemini tamamlayabilirsiniz. Şimdi ise repository'mizin son haline bakalım.

-8<- "merge_commit.md:git-log-2"

Buradan da aşikar olduğu üzere `merge` komutu ile yeni bir commit oluşturulmuş durumda. `main` branch'i artık bu commit'e bakıyor. Bu commit'in hash'i `{{ merge_commit.merge_commit_hash }}` iken, 1 değil **2 adet parent commit**'e, yani `{{ merge_commit.merge_commit_parent_1_hash }}` ve `{{ merge_commit.merge_commit_parent_2_hash }}` commit'lerine baktığını görebiliyoruz. Soldaki graf ile bu birleşme terminal ortamındaki karakterler ile görselleştirilmiş. Bu görsellik bize daha karmaşık repository'lerde yardımcı olacak.

Peki bu merge commit'inin içinde ne var? Bunu yukarıda kullandığımız `git show` komutu ile gösterelim.

-8<- "merge_commit.md:git-show"

Burada herhangi bir dosya değişikliği gözükmüyor iken `{{ merge_commit.merge_indicator_line }}` satırı gözümüze çarpıyor. Bu commit aslında içinde herhangi bir değişiklik barındırmıyor ve sadece 2 adet ayrı commit'e işaret ediyor. Yani aslında sadece bir yertutucu görevi görüyor. Bu özellikteki commit'lere **merge commit** adı verilmektedir.

!!! note "Merge commit'i de değişiklik barındırabilir"
    İleride **conflict** terimine değindiğimizde **merge commit**'lerinin de değişiklik barındırabildiğini göreceğiz.

Buradan da anlaşılacağı üzere bir branch'i diğerine merge etmek aslında commit'leri kopyalamıyor, birleştirmiyor, değiştirmiyor. Bir branch'i diğerine merge etmek aslında commit graf'ına sadece bir düğüm daha ekliyor.

!!! note "Terminoloji"
    `merge` komutu birden fazla branch'i aynı anda merge etmemize de olanak sağlıyor. Bunun sonucunda oluşan merge commit'inin 2'den fazla parent commit'i olabiliyor. Bu yöntem ile yapılan merge işlemlerine **octopus merge** deniliyor. Türkçeleştirmek istersek ahtapot birleşimi diyebiliriz ama bu çok sağlıklı bir karşılık olmaz.

!!! tip "Eğlenceli Bilgiler"
    - GitHub'un maskotu olan ahtapot kedi [Octocat](https://myoctocat.com), aslında Octopus ismindeki ufak bir kelime oyunundan gelmektedir. Bu fikir İngilizcede Octo ve Puss isimlerinin birleşiminden oluşan Octopuss isimli bir stok görselden ortaya çıkmıştır. [Kaynak](https://en.wikipedia.org/wiki/GitHub#Mascot)

    - Linux kernel geliştirmesi sırasında oluşan 66 parent'li bir merge commit'i hakkında [bu yazıyı](https://www.destroyallsoftware.com/blog/2017/the-biggest-and-weirdest-commits-in-linux-kernel-git-history) okumanızı tavsiye ederim.
