# Branch

İlk commitlerimizi attık ve artık 2 committen oluşan bir git repository'sine sahibiz.

-8<- "branch.md:git-log-graph-1"

Şimdi ise git'in bir başka temeli olan bir **branch** oluşturalım. Branch'imizin adını `yeni-branch` diyelim. Hemen ardından ise git'i bu branch'e geçirelim, yani **checkout** ettirelim. Son olarak da repository'de bulunan bütün branch'leri listeleyelim.

!!! note "Terminoloji"
    **Branch** Türkçede bir bütünün bir alt dalı anlamına gelmektedir. Ağaç dalı, eğitim dalı gibi bağlamlardaki kullanımı örnek gösterilebilir. Git bağlamında ise **branch** dallanan, bir noktadan ayrılan commit'leri işaret etmek için kullanılır.

-8<- "branch.md:git-branch-1"

!!! tip "Kısayol"
    Burada tek bir eylem için iki ayrı komutunun bulunmasının sebebi **checkout** komutunun farklı bir işlevinin olmasıdır. Tek komut ile yeni bir branch oluşturup ona **checkout** etmek için `git checkout -b yeni-branch` yapabilirsiniz.

Peki bu yaptığımız eylemler ne işe yaradı? Bir branch oluşturduk ve ona geçtik ancak bu bize ne sağladı ki? Repository'de neler değişti? Bu noktada aslında bir branch'in somut olarak neye dönüştüğünü anlamamız gerekli.

Bu sorunun cevabı için bir önceki sayfada da bahsettiğimiz `.git` klasörünün içine bakalım. Yeni bir branch oluşturunca burada git ne yapıyor olabilir?

-8<- "branch.md:ls-refs-heads"

Burada 2 adet dosya oluşmuş görünüyor. Dosyaların isimleri ise repository'mizdeki branch'lerin isimleri ile uyuşuyor. Peki bu dosyaların içinde ne bulunuyor?

-8<- "branch.md:cat-heads-1"

İçlerinde bir hash bulunuyor ve bu hash bizim son commit'imizin hash'i ile aynı. Yani branch'ler aslında bir commit'e işaret eden bir dosyadan ibaretler. Bunu `git log` çalıştırarak da görebiliriz.

-8<- "branch.md:git-log-graph-2"

Burada `{{ branch.commit_hash_1 }}` hash'li commit'imize `yeni-branch` ve `main` branch'lerinin işaret ettiğini commit hash'inin yanında bulunan `(HEAD -> yeni-branch, main)` bölümü ile görebiliyoruz.

Şimdi yeni bir commit daha atalım ve sonrasında `git log` ile repository'mize tekrar bakalım.

-8<- "branch.md:commit"

`main` branch'imiz hala bir önceki commit'e işaret ediyorken `yeni-branch` isimli branch'imiz yeni attığımız `{{ branch.commit_hash_2 }}` hash'li commit'e işaret etmekte. Peki `.git` klasöründe ne değişiklik oldu?

-8<- "branch.md:cat-heads-2"

Yukarısı bize gösteriyor ki sadece `yeni-branch` dosyasının içindeki hash değişmiş durumda. Yani git terminolojisinde branch dediğimiz temel yapı aslında sadece bir commit işaretçisi olarak çalışıyor. Biz o branch'teyken ne kadar commit atarsak atalım aslında sadece son attığımız commit'in hash'ına işaret eden bir dosyadan ibaret. Bu dizinde bir dosya oluşturarak yeni bir git branch'i oluşturabildiğimizi gelin test edelim.

-8<- "branch.md:manual-branch-creation"

Yukarıdaki `echo` komutu ile bir commit hash'ini `.git/refs/heads` dizininde yeni bir dosyaya yazdırdık. Bunun sonucunda da git'in yeni branch'imizi tanıdığını görmüş olduk. Buradan anlaşılıyor ki branch yapısı önceki attığımız commit'lerin bir listesini herhangi bir yerde tutmuyor. Peki o zaman git bu commit'lerin ve branch'lerin takibini nasıl yapıyor?
