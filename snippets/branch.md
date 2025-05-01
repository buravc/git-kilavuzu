# --8<-- [start:git-log-graph-1]
```bash 
$ git log --graph
* commit be76ce795a4595ed2446185e01e9a7d3134c880d (HEAD -> main)
| Author: <username> <email>
| Date:   Thu May 1 19:30:09 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 0831d6c0aa90b8c52a667750b922b411d36681f8
  Author: <username> <email>
  Date:   Thu May 1 19:30:07 2025 +0200
  
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
be76ce795a4595ed2446185e01e9a7d3134c880d

$ cat .git/refs/heads/yeni-branch
be76ce795a4595ed2446185e01e9a7d3134c880d
```
# --8<-- [end:cat-heads-1]
# --8<-- [start:git-log-graph-2]
```bash 
$ git log --graph
* commit be76ce795a4595ed2446185e01e9a7d3134c880d (HEAD -> yeni-branch, main)
| Author: <username> <email>
| Date:   Thu May 1 19:30:09 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 0831d6c0aa90b8c52a667750b922b411d36681f8
  Author: <username> <email>
  Date:   Thu May 1 19:30:07 2025 +0200
  
      Ilk commit
```
# --8<-- [end:git-log-graph-2]
# --8<-- [start:commit]
```bash 
$ echo "yeni-branch icin merhaba-dunya" >> test.txt

$ git add test.txt

$ git commit -m "yeni-branch icin ilk commitimi atiyorum"
[yeni-branch 3be1429] yeni-branch icin ilk commitimi atiyorum
 1 file changed, 1 insertion(+)

$ git log --graph
* commit 3be14294fb144d1e840be6d6ff2bdeb538b8a20e (HEAD -> yeni-branch)
| Author: <username> <email>
| Date:   Thu May 1 19:30:15 2025 +0200
| 
|     yeni-branch icin ilk commitimi atiyorum
| 
* commit be76ce795a4595ed2446185e01e9a7d3134c880d (main)
| Author: <username> <email>
| Date:   Thu May 1 19:30:09 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 0831d6c0aa90b8c52a667750b922b411d36681f8
  Author: <username> <email>
  Date:   Thu May 1 19:30:07 2025 +0200
  
      Ilk commit
```
# --8<-- [end:commit]
# --8<-- [start:cat-heads-2]
```bash 
$ cat .git/refs/heads/main
be76ce795a4595ed2446185e01e9a7d3134c880d

$ cat .git/refs/heads/yeni-branch
3be14294fb144d1e840be6d6ff2bdeb538b8a20e
```
# --8<-- [end:cat-heads-2]
# --8<-- [start:manual-branch-creation]
```bash 
$ git branch
  main
* yeni-branch

$ echo "3be14294fb144d1e840be6d6ff2bdeb538b8a20e" > .git/refs/heads/yeni-branch-2

$ git branch
  main
* yeni-branch
  yeni-branch-2

$ git checkout yeni-branch-2
Switched to branch 'yeni-branch-2'
```
# --8<-- [end:manual-branch-creation]
