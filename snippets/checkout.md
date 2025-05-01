# --8<-- [start:git-log-graph]
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
# --8<-- [end:git-log-graph]
# --8<-- [start:git-checkout]
```bash hl_lines="19"
$ git checkout 617f94a
Note: switching to '617f94a'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at 617f94a Ilk commit
```
# --8<-- [end:git-checkout]
# --8<-- [start:cat-test-txt]
```bash 
$ cat test.txt
Hello world
```
# --8<-- [end:cat-test-txt]
