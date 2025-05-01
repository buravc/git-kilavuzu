# --8<-- [start:git-log-graph-1]
```bash 
$ git log --graph
* commit cc91c99152b6bfd4d0483201185bf4cf8215097d (HEAD -> main)
| Author: <username> <email>
| Date:   Thu May 1 17:11:34 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 3ef71ec8a02f828955a3ea2751b8eddce5d36e83
  Author: <username> <email>
  Date:   Thu May 1 17:11:32 2025 +0200
  
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
cc91c99152b6bfd4d0483201185bf4cf8215097d

$ cat .git/refs/heads/yeni-branch
cc91c99152b6bfd4d0483201185bf4cf8215097d
```
# --8<-- [end:cat-heads-1]
# --8<-- [start:git-log-graph-2]
```bash 
$ git log --graph
* commit cc91c99152b6bfd4d0483201185bf4cf8215097d (HEAD -> yeni-branch, main)
| Author: <username> <email>
| Date:   Thu May 1 17:11:34 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 3ef71ec8a02f828955a3ea2751b8eddce5d36e83
  Author: <username> <email>
  Date:   Thu May 1 17:11:32 2025 +0200
  
      Ilk commit
```
# --8<-- [end:git-log-graph-2]
# --8<-- [start:commit]
```bash 
$ echo "yeni-branch icin merhaba-dunya" >> test.txt

$ git add test.txt

$ git commit -m "yeni-branch icin ilk commitimi atiyorum"
[yeni-branch 1a45c93] yeni-branch icin ilk commitimi atiyorum
 1 file changed, 1 insertion(+)

$ git log --graph
* commit 1a45c9378a4ee522af4b49f62d989427c3971b61 (HEAD -> yeni-branch)
| Author: <username> <email>
| Date:   Thu May 1 17:11:41 2025 +0200
| 
|     yeni-branch icin ilk commitimi atiyorum
| 
* commit cc91c99152b6bfd4d0483201185bf4cf8215097d (main)
| Author: <username> <email>
| Date:   Thu May 1 17:11:34 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 3ef71ec8a02f828955a3ea2751b8eddce5d36e83
  Author: <username> <email>
  Date:   Thu May 1 17:11:32 2025 +0200
  
      Ilk commit
```
# --8<-- [end:commit]
# --8<-- [start:cat-heads-2]
```bash 
$ cat .git/refs/heads/main
cc91c99152b6bfd4d0483201185bf4cf8215097d

$ cat .git/refs/heads/yeni-branch
1a45c9378a4ee522af4b49f62d989427c3971b61
```
# --8<-- [end:cat-heads-2]
# --8<-- [start:manual-branch-creation]
```bash 
$ git branch
  main
* yeni-branch

$ echo "1a45c9378a4ee522af4b49f62d989427c3971b61" > .git/refs/heads/yeni-branch-2

$ git branch
  main
* yeni-branch
  yeni-branch-2

$ git checkout yeni-branch-2
Switched to branch 'yeni-branch-2'
```
# --8<-- [end:manual-branch-creation]
