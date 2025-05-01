# --8<-- [start:git-log-graph-1]
```bash 
$ git log --graph
* commit 34813837660f442bb757c9450b42bf7ce562f871 (HEAD -> main)
| Author: <username> <email>
| Date:   Thu May 1 14:05:47 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit a8784a788a723c8cb16610769d826376f9f46d0f
  Author: <username> <email>
  Date:   Thu May 1 14:05:45 2025 +0200
  
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
34813837660f442bb757c9450b42bf7ce562f871

$ cat .git/refs/heads/yeni-branch
34813837660f442bb757c9450b42bf7ce562f871
```
# --8<-- [end:cat-heads-1]
# --8<-- [start:git-log-graph-2]
```bash 
$ git log --graph
* commit 34813837660f442bb757c9450b42bf7ce562f871 (HEAD -> yeni-branch, main)
| Author: <username> <email>
| Date:   Thu May 1 14:05:47 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit a8784a788a723c8cb16610769d826376f9f46d0f
  Author: <username> <email>
  Date:   Thu May 1 14:05:45 2025 +0200
  
      Ilk commit
```
# --8<-- [end:git-log-graph-2]
# --8<-- [start:commit]
```bash 
$ echo "yeni-branch icin merhaba-dunya" >> test.txt

$ git add test.txt

$ git commit -m "yeni-branch icin ilk commitimi atiyorum"
[yeni-branch b7ff1e0] yeni-branch icin ilk commitimi atiyorum
 1 file changed, 1 insertion(+)

$ git log --graph
* commit b7ff1e04881de7d9b736c549271aa33e9e8168d4 (HEAD -> yeni-branch)
| Author: <username> <email>
| Date:   Thu May 1 14:05:53 2025 +0200
| 
|     yeni-branch icin ilk commitimi atiyorum
| 
* commit 34813837660f442bb757c9450b42bf7ce562f871 (main)
| Author: <username> <email>
| Date:   Thu May 1 14:05:47 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit a8784a788a723c8cb16610769d826376f9f46d0f
  Author: <username> <email>
  Date:   Thu May 1 14:05:45 2025 +0200
  
      Ilk commit
```
# --8<-- [end:commit]
# --8<-- [start:cat-heads-2]
```bash 
$ cat .git/refs/heads/main
34813837660f442bb757c9450b42bf7ce562f871

$ cat .git/refs/heads/yeni-branch
b7ff1e04881de7d9b736c549271aa33e9e8168d4
```
# --8<-- [end:cat-heads-2]
# --8<-- [start:manual-branch-creation]
```bash 
$ git branch
  main
* yeni-branch

$ echo "b7ff1e04881de7d9b736c549271aa33e9e8168d4" > .git/refs/heads/yeni-branch-2

$ git branch
  main
* yeni-branch
  yeni-branch-2

$ git checkout yeni-branch-2
Switched to branch 'yeni-branch-2'
```
# --8<-- [end:manual-branch-creation]
