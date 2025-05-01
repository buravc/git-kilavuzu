# --8<-- [start:git-log-graph]
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
# --8<-- [end:git-log-graph]
# --8<-- [start:git-checkout]
```bash hl_lines="19"
$ git checkout a8784a7
Note: switching to 'a8784a7'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at a8784a7 Ilk commit
```
# --8<-- [end:git-checkout]
# --8<-- [start:cat-test-txt]
```bash 
$ cat test.txt
Hello world
```
# --8<-- [end:cat-test-txt]
