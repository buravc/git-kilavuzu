```bash 
$ git log --graph --patch
* commit e82cae31874e8bc28f53542370472d08676ac28b (HEAD -> main)
| Author: <username> <email>
| Date:   Sun Apr 27 14:16:34 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
| diff --git a/test.txt b/test.txt
| index 802992c..da9d8ba 100644
| --- a/test.txt
| +++ b/test.txt
| @@ -1 +1,2 @@
|  Hello world
| +Merhaba Dunya
| 
* commit 09f136a14d380791e91a57dab0dcc1797decd449
  Author: <username> <email>
  Date:   Sun Apr 27 14:16:34 2025 +0200
  
      Ilk commit
  
  diff --git a/test.txt b/test.txt
  new file mode 100644
  index 0000000..802992c
  --- /dev/null
  +++ b/test.txt
  @@ -0,0 +1 @@
  +Hello world
```
