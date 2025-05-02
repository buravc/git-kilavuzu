# --8<-- [start:git-log-graph-1]
```bash 
$ git log --graph
* commit 5691da539dddcf7440f330a2f2d1e064859a164f (HEAD -> main)
| Author: <username> <email>
| Date:   Fri May 2 21:27:40 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit a0d61de80d7b70e85c57d9d3959b3642dd68cd5c
  Author: <username> <email>
  Date:   Fri May 2 21:27:38 2025 +0200
  
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
5691da539dddcf7440f330a2f2d1e064859a164f

$ cat .git/refs/heads/yeni-branch
5691da539dddcf7440f330a2f2d1e064859a164f
```
# --8<-- [end:cat-heads-1]
# --8<-- [start:git-log-graph-2]
```bash 
$ git log --graph
* commit 5691da539dddcf7440f330a2f2d1e064859a164f (HEAD -> yeni-branch, main)
| Author: <username> <email>
| Date:   Fri May 2 21:27:40 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit a0d61de80d7b70e85c57d9d3959b3642dd68cd5c
  Author: <username> <email>
  Date:   Fri May 2 21:27:38 2025 +0200
  
      Ilk commit
```
# --8<-- [end:git-log-graph-2]
# --8<-- [start:commit]
```bash 
$ echo "yeni-branch icin merhaba-dunya" >> test.txt

$ git add test.txt

$ git commit -m "yeni-branch icin ilk commitimi atiyorum"
[yeni-branch 3c9874b] yeni-branch icin ilk commitimi atiyorum
 1 file changed, 1 insertion(+)

$ git log --graph
* commit 3c9874b3caa2e4d06968cf70fb729d6eb61e9e06 (HEAD -> yeni-branch)
| Author: <username> <email>
| Date:   Fri May 2 21:27:47 2025 +0200
| 
|     yeni-branch icin ilk commitimi atiyorum
| 
* commit 5691da539dddcf7440f330a2f2d1e064859a164f (main)
| Author: <username> <email>
| Date:   Fri May 2 21:27:40 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit a0d61de80d7b70e85c57d9d3959b3642dd68cd5c
  Author: <username> <email>
  Date:   Fri May 2 21:27:38 2025 +0200
  
      Ilk commit
```
# --8<-- [end:commit]
# --8<-- [start:cat-heads-2]
```bash 
$ cat .git/refs/heads/main
5691da539dddcf7440f330a2f2d1e064859a164f

$ cat .git/refs/heads/yeni-branch
3c9874b3caa2e4d06968cf70fb729d6eb61e9e06
```
# --8<-- [end:cat-heads-2]
# --8<-- [start:manual-branch-creation]
```bash 
$ git branch
  main
* yeni-branch

$ echo "3c9874b3caa2e4d06968cf70fb729d6eb61e9e06" > .git/refs/heads/yeni-branch-2

$ git branch
  main
* yeni-branch
  yeni-branch-2

$ git checkout yeni-branch-2
Switched to branch 'yeni-branch-2'
```
# --8<-- [end:manual-branch-creation]
