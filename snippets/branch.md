# --8<-- [start:git-log-graph-1]
```bash 
$ git log --graph
* commit 777f68a6ba056e0bdfd674c3f8646ea2f9b04520 (HEAD -> main)
| Author: <username> <email>
| Date:   Fri May 2 21:49:04 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 95e7356f75c2d844d9d1d7ba42fd5b40a5fd5ecf
  Author: <username> <email>
  Date:   Fri May 2 21:49:02 2025 +0200
  
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
777f68a6ba056e0bdfd674c3f8646ea2f9b04520

$ cat .git/refs/heads/yeni-branch
777f68a6ba056e0bdfd674c3f8646ea2f9b04520
```
# --8<-- [end:cat-heads-1]
# --8<-- [start:git-log-graph-2]
```bash 
$ git log --graph
* commit 777f68a6ba056e0bdfd674c3f8646ea2f9b04520 (HEAD -> yeni-branch, main)
| Author: <username> <email>
| Date:   Fri May 2 21:49:04 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 95e7356f75c2d844d9d1d7ba42fd5b40a5fd5ecf
  Author: <username> <email>
  Date:   Fri May 2 21:49:02 2025 +0200
  
      Ilk commit
```
# --8<-- [end:git-log-graph-2]
# --8<-- [start:commit]
```bash 
$ echo "yeni-branch icin merhaba-dunya" >> test.txt

$ git add test.txt

$ git commit -m "yeni-branch icin ilk commitimi atiyorum"
[yeni-branch dc2243f] yeni-branch icin ilk commitimi atiyorum
 1 file changed, 1 insertion(+)

$ git log --graph
* commit dc2243f197f26719f94687238bb0f9310da223d2 (HEAD -> yeni-branch)
| Author: <username> <email>
| Date:   Fri May 2 21:49:11 2025 +0200
| 
|     yeni-branch icin ilk commitimi atiyorum
| 
* commit 777f68a6ba056e0bdfd674c3f8646ea2f9b04520 (main)
| Author: <username> <email>
| Date:   Fri May 2 21:49:04 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 95e7356f75c2d844d9d1d7ba42fd5b40a5fd5ecf
  Author: <username> <email>
  Date:   Fri May 2 21:49:02 2025 +0200
  
      Ilk commit
```
# --8<-- [end:commit]
# --8<-- [start:cat-heads-2]
```bash 
$ cat .git/refs/heads/main
777f68a6ba056e0bdfd674c3f8646ea2f9b04520

$ cat .git/refs/heads/yeni-branch
dc2243f197f26719f94687238bb0f9310da223d2
```
# --8<-- [end:cat-heads-2]
# --8<-- [start:manual-branch-creation]
```bash 
$ git branch
  main
* yeni-branch

$ echo "dc2243f197f26719f94687238bb0f9310da223d2" > .git/refs/heads/yeni-branch-2

$ git branch
  main
* yeni-branch
  yeni-branch-2

$ git checkout yeni-branch-2
Switched to branch 'yeni-branch-2'
```
# --8<-- [end:manual-branch-creation]
