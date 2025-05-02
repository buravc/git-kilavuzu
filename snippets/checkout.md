# --8<-- [start:git-log-graph]
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
# --8<-- [end:git-log-graph]
# --8<-- [start:git-checkout]
```bash hl_lines="19"
$ git checkout a0d61de
Note: switching to 'a0d61de'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at a0d61de Ilk commit
```
# --8<-- [end:git-checkout]
# --8<-- [start:cat-test-txt]
```bash 
$ cat test.txt
Hello world
```
# --8<-- [end:cat-test-txt]
