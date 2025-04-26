# Commit History

Bence git öğrenirken yapılan en yaygın hata bir **commit**'in tam olarak ne olduğunu anlamamak ve git'i varsayımlarda bulunarak kullanmaya devam etmek. İnternetteki Türkçe kaynakların birçoğunun da buna doğru bir şekilde değinemediğini düşünüyorum.

Git repository'deki yapılan değişiklikleri gruplamak ve saklamak için **commit** denilen bir yapı kullanmaktadır. Bir **commit** attığımızda aslında o zamanda yaptığımız değişiklikler sonucunda repository'deki **dosyaların son halini** bir araya toplayarak git'in veritabanına kayıt etmiş oluruz.

Bir **commit**, hem bir sahibi olan, yani bir kullanıcı adı ve email ile bağdaştırılan, hem de bir **parent commit**'i olan bir yapıdır. Her **commit**'in **en az bir parent commit**'i olmak zorundadır. Bunu `git log` komutunda `--parents` bayrağını kullanarak görebiliriz.

!!! tip "`--oneline` bayrağı"
    Burada çıktıyı sadeleştirmek için `--oneline` bayrağını da ekleyelim. Böylece log'da her commit artık sadece 1 satır, yani **one line** yer kaplayacak.

```bash
$ git log --graph --parents --oneline
* c973c9d 419a640 (HEAD -> yeni-branch) yeni-branch icin ilk commitimi atiyorum
* 419a640 beddf6b (main) Dosyaya Merhaba Dunya ekledim
* beddf6b Ilk commit
```

- `--oneline` bayrağı ile artık log'da her satır bir commit'e denk geliyor ve hash'ların sadece ilk 7 karakteri yazılıyor.
- `--parents` bayrağı ile her satırın başında 2 adet farklı hash bulunuyor. İlk hash commit'in kendi hash'i iken ikinci hash ise parent commit'in hash'i oluyor.

Log'da da görülebileceği üzere aslında commit'lerimiz arasında linked list'e benzer, geriye dönük bir graf yapısı bulunmaktadır. Commit'ler kendilerinden önce gelen commit'leri, yani *parent commit*'i işaret ederek bir ağaç oluştururlar.

!!! note "Terminoloji"
    **Parent** için Türkçe bir terim bulamadım. Burada bir önceki commit veya **ata commit** diye düşünebiliriz.
!!! note "En az bir parent"
    Gelecekte bazı commit'lerin birden çok parent'ı olabildiğini göreceğiz. Burada bir istisna olarak bir repository'de atılan ilk commit'i örnek gösterebiliriz. İlk olduğu için o commit'in bir parent'ı bulunmamaktadır.

Bu bilgilerin ışığında geçtiğimiz sayfada hazırladığımız repository'i üzerinde yaptığımız değişiklikler sonucunda şekillenen bütün **commit history**'i şu şekilde görselleştirebiliriz.

!!! note "Terminoloji"
    **Commit history** bir git repository'sindeki, genelde bir branch'e ait, commit grafiği veya commit geçmişi anlamında kullanılır.

![image info](./images/commit-history-1.gif)

Buradan yola çıkarak, bir branch'in **commit history**'de basitçe bir noktaya işaret eden bir referans olduğu sonucuna varabiliriz. Commit hash'leri kullanmak yerine branch'leri kullanmanın bize faydalarını şu şekilde listeleyebiliriz:

- Bu işaretler sayesinde istediğimiz bir commit dalına commit hash'leri yerine daha okunabilir ve hatırlanabilir isimler ile işaret edebiliyoruz.
- Commit hash'leri sabit ve spesifik bir commit'e işaret edebiliyorken branch'lerin işaret ettiği, veya **"baktığı"** commit'ler değişebiliyor. Bu da bize bazı durumlarda, örneğin yaptığımız değişiklikleri bir zincir olarak gruplamak ve isimlendirmek istediğimiz durumlarda, esneklik sağlıyor.