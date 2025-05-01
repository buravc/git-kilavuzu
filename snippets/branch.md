# --8<-- [start:git-log-graph-1]
```bash 
$ git log --graph
* commit c3919433b36c5abf8c76586946e356aff0f1d348 (HEAD -> main)
| Author: <username> <email>
| Date:   Thu May 1 17:51:37 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 469f4cba474c35d2b42754f549052ab18a73aeb0
  Author: <username> <email>
  Date:   Thu May 1 17:51:35 2025 +0200
  
      Ilk commit
```
# --8<-- [end:git-log-graph-1]
# --8<-- [start:git-branch-1]
```bash 
$ git branch yeni-branch

$ git checkout yeni-branch
Switched to branch 'yeni-branch'

$ git branch
  main
* yeni-branch
```
# --8<-- [end:git-branch-1]
# --8<-- [start:ls-refs-heads]
```bash 
$ ls .git/refs/heads
main
yeni-branch
```
# --8<-- [end:ls-refs-heads]
# --8<-- [start:cat-heads-1]
```bash 
$ cat .git/refs/heads/main
c3919433b36c5abf8c76586946e356aff0f1d348

$ cat .git/refs/heads/yeni-branch
c3919433b36c5abf8c76586946e356aff0f1d348
```
# --8<-- [end:cat-heads-1]
# --8<-- [start:git-log-graph-2]
```bash 
$ git log --graph
* commit c3919433b36c5abf8c76586946e356aff0f1d348 (HEAD -> yeni-branch, main)
| Author: <username> <email>
| Date:   Thu May 1 17:51:37 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 469f4cba474c35d2b42754f549052ab18a73aeb0
  Author: <username> <email>
  Date:   Thu May 1 17:51:35 2025 +0200
  
      Ilk commit
```
# --8<-- [end:git-log-graph-2]
# --8<-- [start:commit]
```bash 
$ echo "yeni-branch icin merhaba-dunya" >> test.txt

$ git add test.txt

$ git commit -m "yeni-branch icin ilk commitimi atiyorum"
[yeni-branch 694de91] yeni-branch icin ilk commitimi atiyorum
 1 file changed, 1 insertion(+)

$ git log --graph
* commit 694de911a0c6ba38ba9d5d40119bc238256f5ee0 (HEAD -> yeni-branch)
| Author: <username> <email>
| Date:   Thu May 1 17:51:44 2025 +0200
| 
|     yeni-branch icin ilk commitimi atiyorum
| 
* commit c3919433b36c5abf8c76586946e356aff0f1d348 (main)
| Author: <username> <email>
| Date:   Thu May 1 17:51:37 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 469f4cba474c35d2b42754f549052ab18a73aeb0
  Author: <username> <email>
  Date:   Thu May 1 17:51:35 2025 +0200
  
      Ilk commit
```
# --8<-- [end:commit]
# --8<-- [start:cat-heads-2]
```bash 
$ cat .git/refs/heads/main
c3919433b36c5abf8c76586946e356aff0f1d348

$ cat .git/refs/heads/yeni-branch
694de911a0c6ba38ba9d5d40119bc238256f5ee0
```
# --8<-- [end:cat-heads-2]
# --8<-- [start:manual-branch-creation]
```bash 
$ git branch
  main
* yeni-branch

$ echo "694de911a0c6ba38ba9d5d40119bc238256f5ee0" > .git/refs/heads/yeni-branch-2

$ git branch
  main
* yeni-branch
  yeni-branch-2

$ git checkout yeni-branch-2
Switched to branch 'yeni-branch-2'
```
# --8<-- [end:manual-branch-creation]
