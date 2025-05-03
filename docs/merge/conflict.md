# Conflict

Biri diğerini kapsayan iki branch için merge işleminde **fast-forward merge** yapılarak işlemin sadeleştirildiğini öğrendik. Bunun üzerine birbirinden ayrılmış olan bir branch'i diğerine merge ederken **fast-forward**'in mümkün olmadığını öğrendik. Şimdi ise merge konusunda karşılaşılabilecek bir duruma değineceğim. Bunu bir örnek ile anlatalım.

`A` ve `B` isminde iki branch'imiz olduğunu varsayalım. `A` branch'indeyken `test.txt` dosyasının **ilk** satırını değiştirip bir commit attık. Artık `A` branch'imizde bu değişiklik bulunmakta. `B` branch'indeyken de aynı işlemi tekrarladım ve **ilk** satırı değiştirerek commit attık. Artık birbirinden ayrı ve aynı dosya üzerinde farklı değişiklikleri olan 2 branch'imiz var. Peki bu durumda `B` branch'ini `A` branch'ine merge etmek istersek, git `test.txt` dosyasındaki iki farklı branch'teki değişikliği nasıl birleştirecek?

-8<- "conflict.md:git-first-commit"

Şimdi ise merge işleminden önce repository'mizin son haline bakalım.

-8<- "conflict.md:git-log-1"

`dal-A` ve `dal-B` branch'leri birbirinden ayrılmış durumda. `dal-A` branch'ine geçerek `dal-B` branch'ini merge edelim.

-8<- "conflict.md:git-merge"

Gördüğünüz gibi bir hata ile karşılaştık. Burada sözlüğümüze yeni bir terimi ekleyebiliriz.

!!! note "Terminoloji"
    **Conflict** bir git işlemi sırasında bir dosya üzerinde meydana gelen, ve birbirini kapsamayan, yani history'leri farklı olan iki farklı commit'te meydana gelen değişikliğin birbiriyle çakışması durumudur.

Bu noktada repository'miz artık özel bir duruma geçmiştir. Git bu merge esnasında oluşan **conflict**'in manuel olarak çözülmesini beklemektedir. Repository'mizin son durumuna bakarak durum hakkında bir fikir sahibi olalım.

-8<- "conflict.md:git-status"

Bu noktada yukarıda git'in de bize açıkça belirttiği üzere iki seçeneğimiz bulunmaktadır:

- Oluşan **conflict**'i elle çözebilirsiniz.
- Merge işlemini iptal ederek `dal-A` branch'ine geri dönmektir. Bunu `git merge --abort` ile yapabilirsiniz.

Bu conflict'i elle çözmek için öncelikle **conflict** olan `test.txt` dosyamızın içeriğine göz atalım.

-8<- "conflict.md:cat-conflicted-file"

Görüldüğü üzere iki branch'te yapılan farklı değişiklikler dosyanın içerisinde mevcut ancak aralarına özel işaretleyiciler konularak ayrılmış. Burada bu **conflict**'i elle çözmek için bu dosyayı bir text editor yardımıyla açarak son halinin nasıl olmasını istediğimize karar vermek.

Bu örneğimiz açısından bir editor yardımı ile `dal-B` branch'inden gelen satırı tutup kalanını silerek devam edebiliriz. Daha sonrasında ise merge işlemine devam edelim.

-8<- "conflict.md:git-merge-continue"

Merge işlemini başarılı bir şekilde tamamladıktan sonra `git log` şu şekilde görünecektir.

-8<- "conflict.md:git-log-2"

2 adet parent commit'e bakan yeni bir **merge commit** ile iki commit dalı birbirine başarılı bir şekilde bağlanmış ve `dal-A` branch'i bu yeni commit'e taşınmış durumda.

!!! note "Merge Commit'inde değişiklik"
    Eğer ki bu **conflict**'i çözerken `test.txt` üzerinde git'in **index**'inde bulunmayan farklı bir değişiklik yapmış olsaydık, örneğin yeni bir satıra yeni bir yazı ekleseydik, merge commit'imizde bu değişiklik yer alacaktı.
    ```bash hl_lines="3 16"
    $ git show 3bfac7d
    commit 3bfac7da6102da926b2ad4f319f22e3c617c26c8 (HEAD -> dal-A)
    Merge: a1ef269 f3a666a
    Author: <username> <email>
    Date:   Mon Apr 21 18:52:14 2025 +0200

    Merge branch 'dal-B' into dal-A

    diff --cc test.txt
    index f995c5f,2c7ce7b..39d67bc
    --- a/test.txt
    +++ b/test.txt
    @@@ -1,4 -1,4 +1,5 @@@
    - dal-A Hello world
    + dal-B icin Hello world satiri yaziyorum
    ++--> Conflict cozerken bu yeni satiri ekledim <--
      Merhaba Dunya
      yeni-branch icin merhaba dunya
      dal B icin degisiklik
    ```