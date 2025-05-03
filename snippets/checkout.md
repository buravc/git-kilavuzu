# --8<-- [start:git-log-graph]
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
# --8<-- [end:git-log-graph]
# --8<-- [start:git-checkout]
```bash hl_lines="19"
$ git checkout 95e7356
Note: switching to '95e7356'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at 95e7356 Ilk commit
```
# --8<-- [end:git-checkout]
# --8<-- [start:cat-test-txt]
```bash 
$ cat test.txt
Hello world
```
# --8<-- [end:cat-test-txt]
