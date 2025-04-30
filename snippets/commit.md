# --8<-- [start:hello-world]
```bash 
$ echo "Hello world" > test.txt
```
# --8<-- [end:hello-world]
# --8<-- [start:git-status]
```bash hl_lines="6-8"
$ git status
On branch main

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	test.txt

nothing added to commit but untracked files present (use "git add" to track)
```
# --8<-- [end:git-status]
# --8<-- [start:git-add-git-status-1]
```bash 
$ git add test.txt

$ git status
On branch main

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   test.txt

```
# --8<-- [end:git-add-git-status-1]
# --8<-- [start:git-commit-1]
```bash 
$ git commit -m "Ilk commit"
[main (root-commit) b80872c] Ilk commit
 1 file changed, 1 insertion(+)
 create mode 100644 test.txt
```
# --8<-- [end:git-commit-1]
# --8<-- [start:git-log-1]
```bash 
$ git log
commit b80872c0b17c7f7e6a028dbd5121149ad21a7416 (HEAD -> main)
Author: <username> <email>
Date:   Wed Apr 30 22:51:01 2025 +0200

    Ilk commit
```
# --8<-- [end:git-log-1]
# --8<-- [start:echo-merhaba-git-status]
```bash 
$ echo "Merhaba Dunya" >> test.txt

$ git status
On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   test.txt

no changes added to commit (use "git add" and/or "git commit -a")
```
# --8<-- [end:echo-merhaba-git-status]
# --8<-- [start:git-add-git-status-2]
```bash 
$ git add test.txt

$ git status
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   test.txt

```
# --8<-- [end:git-add-git-status-2]
# --8<-- [start:git-commit-2]
```bash 
$ git commit -m "Dosyaya Merhaba Dunya ekledim"
[main 726c3f4] Dosyaya Merhaba Dunya ekledim
 1 file changed, 1 insertion(+)
```
# --8<-- [end:git-commit-2]
# --8<-- [start:git-log-graph]
```bash 
$ git log --graph
* commit 726c3f46ca6f99eb1466d3b22ebf7521e276758f (HEAD -> main)
| Author: <username> <email>
| Date:   Wed Apr 30 22:51:03 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit b80872c0b17c7f7e6a028dbd5121149ad21a7416
  Author: <username> <email>
  Date:   Wed Apr 30 22:51:01 2025 +0200
  
      Ilk commit
```
# --8<-- [end:git-log-graph]
# --8<-- [start:git-log-graph-patch]
```bash 
$ git log --graph --patch
* commit 726c3f46ca6f99eb1466d3b22ebf7521e276758f (HEAD -> main)
| Author: <username> <email>
| Date:   Wed Apr 30 22:51:03 2025 +0200
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
* commit b80872c0b17c7f7e6a028dbd5121149ad21a7416
  Author: <username> <email>
  Date:   Wed Apr 30 22:51:01 2025 +0200
  
      Ilk commit
  
  diff --git a/test.txt b/test.txt
  new file mode 100644
  index 0000000..802992c
  --- /dev/null
  +++ b/test.txt
  @@ -0,0 +1 @@
  +Hello world
```
# --8<-- [end:git-log-graph-patch]
