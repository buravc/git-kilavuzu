# --8<-- [start:git-log-graph]
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
# --8<-- [end:git-log-graph]
# --8<-- [start:git-checkout]
```bash hl_lines="19"
$ git checkout 0831d6c
Note: switching to '0831d6c'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at 0831d6c Ilk commit
```
# --8<-- [end:git-checkout]
# --8<-- [start:cat-test-txt]
```bash 
$ cat test.txt
Hello world
```
# --8<-- [end:cat-test-txt]
