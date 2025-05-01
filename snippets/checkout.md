# --8<-- [start:git-log-graph]
```bash 
$ git log --graph
* commit c3919433b36c5abf8c76586946e356aff0f1d348 (HEAD -> main)
| Author: <username> <email>
| Date:   Thu May 1 17:51:37 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 469f4cba474c35d2b42754f549052ab18a73aeb0
  Author: <username> <email>
  Date:   Thu May 1 17:51:35 2025 +0200
  
      Ilk commit
```
# --8<-- [end:git-log-graph]
# --8<-- [start:git-checkout]
```bash hl_lines="19"
$ git checkout 469f4cb
Note: switching to '469f4cb'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at 469f4cb Ilk commit
```
# --8<-- [end:git-checkout]
# --8<-- [start:cat-test-txt]
```bash 
$ cat test.txt
Hello world
```
# --8<-- [end:cat-test-txt]
