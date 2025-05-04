# --8<-- [start:git-log]
```bash 
$ git log --graph --all --oneline
* 7894926 (HEAD -> dal-A) squash merge dal-B
*   eb02546 Merge branch 'dal-B' into dal-A
|\  
* | 8cd6f22 test.txt dal-A icin degistirdim
| | * 5fa6930 (dal-B) degisiklik-2
| | * 8dd8796 degisiklik-1
| |/  
| * 2c6d144 test.txt dal-B icin degistirdim
|/  
* cef4e44 (main) dal-B icin degisiklik yaptim
*   b5b6c09 Merge branch 'yeni-branch'
|\  
| * dc2243f (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
* | 9a63d64 test-2.txt dosyasini ekledim
|/  
* 777f68a Dosyaya Merhaba Dunya ekledim
* 95e7356 Ilk commit
```
# --8<-- [end:git-log]
# --8<-- [start:orphan-branch]
```bash 
$ git checkout --orphan yeni-bir-branch
Switched to a new branch 'yeni-bir-branch'

# eski commit'ten kalan dizin yapisini temizleyelim
$ git rm -rf .
rm 'test-2.txt'
rm 'test.txt'

$ echo "Yeni Bir Baslangic Yapiyorum" > yeni-bir-baslangic.txt

$ git add yeni-bir-baslangic.txt

$ git commit -m "yeni bir baslangic"
[yeni-bir-branch (root-commit) 7eb6f87] yeni bir baslangic
 1 file changed, 1 insertion(+)
 create mode 100644 yeni-bir-baslangic.txt

$ git log --all --max-parents=0
commit 7eb6f87f0dae69f6a068004caea18eb0b3868e51 (HEAD -> yeni-bir-branch)
Author: <username> <email>
Date:   Sun May 4 13:58:48 2025 +0200

    yeni bir baslangic

commit 95e7356f75c2d844d9d1d7ba42fd5b40a5fd5ecf
Author: <username> <email>
Date:   Fri May 2 21:49:02 2025 +0200

    Ilk commit
```
# --8<-- [end:orphan-branch]
# --8<-- [start:sorgu-1]
```bash 
$ git log --oneline | grep "95e7356"
95e7356 Ilk commit
```
# --8<-- [end:sorgu-1]
# --8<-- [start:sorgu-2]
```bash 
$ git log --oneline | grep "dc2243f"
dc2243f (yeni-branch-2, yeni-branch) yeni-branch icin ilk commitimi atiyorum
```
# --8<-- [end:sorgu-2]
# --8<-- [start:sorgu-3]
```bash 
$ git log --oneline | grep "5fa6930"

```
# --8<-- [end:sorgu-3]
# --8<-- [start:alternatif-komut-rev-list]
```bash 
$ git rev-list dal-A | grep "dc2243f197f26719f94687238bb0f9310da223d2"
dc2243f197f26719f94687238bb0f9310da223d2
```
# --8<-- [end:alternatif-komut-rev-list]
# --8<-- [start:alternatif-komut-merge-base-1]
```bash 
# `yeni-branch` isimli branch'in isaret ettigi commit
# `dal-A` branch'inin isaret ettigi commit'in atasi mi?
# $? ile bir onceki komutun cikis kodunu alip bunu da `echo` ile yazdirabiliriz.
$ git merge-base --is-ancestor yeni-branch dal-A && echo $?
0
```
# --8<-- [end:alternatif-komut-merge-base-1]
# --8<-- [start:alternatif-komut-merge-base-2]
```bash 
# `dal-B` isimli branch'in isaret ettigi commit
# `dal-A` branch'inin isaret ettigi commit'in atasi mi?
# Burada bir onceki komutun aksine `||` operatorunu kullanmamiz gerekiyor
# aksi taktirde `&&` kullansaydik sol taraftaki komut
# 0'dan farkli bir kod ile cikis yapacagi icin sagdaki komut hic calismayacakti.
$ git merge-base --is-ancestor dal-B dal-A || echo $?
1
```
# --8<-- [end:alternatif-komut-merge-base-2]
