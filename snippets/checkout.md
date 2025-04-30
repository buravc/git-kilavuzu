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
# --8<-- [start:git-checkout]
```bash hl_lines="19"
$ git checkout b80872c
Note: switching to 'b80872c'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at b80872c Ilk commit
```
# --8<-- [end:git-checkout]
# --8<-- [start:cat-test-txt]
```bash 
$ cat test.txt
Hello world
```
# --8<-- [end:cat-test-txt]
