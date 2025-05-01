# --8<-- [start:git-log-graph]
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
# --8<-- [end:git-log-graph]
# --8<-- [start:git-checkout]
```bash hl_lines="19"
$ git checkout 3ef71ec
Note: switching to '3ef71ec'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at 3ef71ec Ilk commit
```
# --8<-- [end:git-checkout]
# --8<-- [start:cat-test-txt]
```bash 
$ cat test.txt
Hello world
```
# --8<-- [end:cat-test-txt]
