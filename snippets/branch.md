# --8<-- [start:git-log-graph-1]
```bash 
$ git log --graph
* commit 68fcb45f0320b793b330118a03c340af5a713489 (HEAD -> main)
| Author: <username> <email>
| Date:   Thu May 1 13:51:54 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 617f94ae8c2053000b49988f5bcf66f77a9d2c88
  Author: <username> <email>
  Date:   Thu May 1 13:51:52 2025 +0200
  
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
68fcb45f0320b793b330118a03c340af5a713489

$ cat .git/refs/heads/yeni-branch
68fcb45f0320b793b330118a03c340af5a713489
```
# --8<-- [end:cat-heads-1]
# --8<-- [start:git-log-graph-2]
```bash 
$ git log --graph
* commit 68fcb45f0320b793b330118a03c340af5a713489 (HEAD -> yeni-branch, main)
| Author: <username> <email>
| Date:   Thu May 1 13:51:54 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 617f94ae8c2053000b49988f5bcf66f77a9d2c88
  Author: <username> <email>
  Date:   Thu May 1 13:51:52 2025 +0200
  
      Ilk commit
```
# --8<-- [end:git-log-graph-2]
# --8<-- [start:commit]
```bash 
$ echo "yeni-branch icin merhaba-dunya" >> test.txt

$ git add test.txt

$ git commit -m "yeni-branch icin ilk commitimi atiyorum"
[yeni-branch b3ebf89] yeni-branch icin ilk commitimi atiyorum
 1 file changed, 1 insertion(+)

$ git log --graph
* commit b3ebf891fc083a8af6fb79cc1797447557f9a0ad (HEAD -> yeni-branch)
| Author: <username> <email>
| Date:   Thu May 1 13:52:00 2025 +0200
| 
|     yeni-branch icin ilk commitimi atiyorum
| 
* commit 68fcb45f0320b793b330118a03c340af5a713489 (main)
| Author: <username> <email>
| Date:   Thu May 1 13:51:54 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 617f94ae8c2053000b49988f5bcf66f77a9d2c88
  Author: <username> <email>
  Date:   Thu May 1 13:51:52 2025 +0200
  
      Ilk commit
```
# --8<-- [end:commit]
# --8<-- [start:cat-heads-2]
```bash 
$ cat .git/refs/heads/main
68fcb45f0320b793b330118a03c340af5a713489

$ cat .git/refs/heads/yeni-branch
b3ebf891fc083a8af6fb79cc1797447557f9a0ad
```
# --8<-- [end:cat-heads-2]
# --8<-- [start:manual-branch-creation]
```bash 
$ git branch
  main
* yeni-branch

$ echo "b3ebf891fc083a8af6fb79cc1797447557f9a0ad" > .git/refs/heads/yeni-branch-2

$ git branch
  main
* yeni-branch
  yeni-branch-2

$ git checkout yeni-branch-2
Switched to branch 'yeni-branch-2'
```
# --8<-- [end:manual-branch-creation]
