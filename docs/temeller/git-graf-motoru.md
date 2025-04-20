# Git Aslinda Bir Graf Motoru

Git repository'deki yapilan degisiklikleri gruplamak ve saklamak icin **commit** denilen bir yapi kullanmaktadir. Bir commit attigimizda aslinda o zamanda yaptigimiz degisiklikleri tek bir grup icerisinde toplayarak repository'e kayit etmis oluruz. Git ogrenirken yapilan en yaygin hata bence bir **commit**'in tam olarak ne oldugunu anlamamak ve varsayimlarla devam etmek. Internetteki kaynaklarin bircogu da buna dogru bir sekilde deginememekte.

Bir commit, hem bir sahibi olan, yani bir kullanici adi ve email ile bagdastirilan, hem de bir **parent commit**'i olan bir yapidir. Yani her commit'in **en az bir parent** commit'i olmak zorundadir. Bunu `git log` komutunda `--parents` bayragini kullanarak gorebiliriz. Buna ek olarak ciktiyi sadelestirmek icin `--oneline` bayragini da ekleyelim.

```bash
$ git log --graph --parents --oneline
* c973c9d 419a640 (HEAD -> yeni-branch) yeni-branch icin ilk commitimi atiyorum
* 419a640 beddf6b (main) Dosyaya Merhaba Dunya ekledim
* beddf6b Ilk commit
```

- `--oneline` bayragi ile artik log'da her satir bir commit'e denk geliyor ve hash'larin sadece ilk 7 karakteri yaziliyor.
- `--parents` bayragi ile her satirin basinda 2 adet farkli hash bulunuyor. Ilk hash commit'in kendi hash'i iken ikinci hash ise parent commit'in hash'i oluyor.

!!! note "Parent Commit"
    `Parent` icin Turkce bir terim bulamadim. Burada bir onceki commit veya **ata commit** diye dusunebiliriz.
!!! note "En az bir parent"
    Gelecekte bazi commit'lerin birden cok parent'i olabildigini gorecegiz. Burada bir istisna olarak bir repository'de atilan ilk commit'i ornek gosterebiliriz. Ilk oldugu icin o commit'in bir parent'i bulunmamaktadir.

