# --8<-- [start:find-and-print-test-txt-blob]
```bash 
$ git cat-file -p 49664afeafb81dd195da85101c35bfdb18fd277b
040000 tree 3b863a1570fbd49a0edddaa19e139d914e8fe5de	alt-dizinim
100644 blob 3be11c69355948412925fa5e073d76d58ff3afd2	test-2.txt
100644 blob 52ac9288adff03447ba51676ca78a830d8b69ccb	test.txt
```
```bash
$ git cat-file -p 52ac9288adff03447ba51676ca78a830d8b69ccb
dal-B icin Hello world satiri yaziyorum
Merhaba Dunya
yeni-branch icin merhaba-dunya
dal B icin degisiklik
Degisiklik-1
Degisiklik-2

```
# --8<-- [end:find-and-print-test-txt-blob]
# --8<-- [start:manual-hash]
```bash 
# blob hash'i icin olusturmamiz gereken format:
#
# blob <dosyanin-boyut>\0<dosyanin-icerigi>\n
#
# sonrasinda bu formatin sha1 ile hash'ini alacagiz
$ BOYUT="$(cat test.txt | wc -c | tr -d ' ')"

$ ICERIK="$(cat test.txt)"

$ printf "blob ${BOYUT}\0${ICERIK}\n" | sha1sum
52ac9288adff03447ba51676ca78a830d8b69ccb  -

```
# --8<-- [end:manual-hash]
# --8<-- [start:git-hash]
```bash 
$ git hash-object test.txt
52ac9288adff03447ba51676ca78a830d8b69ccb

```
# --8<-- [end:git-hash]
