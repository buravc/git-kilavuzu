# --8<-- [start:git-log-graph]
```bash 
$ git log --graph
* commit 7813aec794b46a914695861412a04fae91720334 (HEAD -> main)
| Author: <username> <email>
| Date:   Wed Apr 30 22:21:30 2025 +0200
| 
|     Dosyaya Merhaba Dunya ekledim
| 
* commit 8951e947cb69b53dcee2b11ad4f0495afc3634c3
  Author: <username> <email>
  Date:   Wed Apr 30 22:21:28 2025 +0200
  
      Ilk commit
```
# --8<-- [end:git-log-graph]
# --8<-- [start:git-checkout]
```bash hl_lines="19"
$ git checkout 8951e94
Note: switching to '8951e94'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at 8951e94 Ilk commit
```
# --8<-- [end:git-checkout]
# --8<-- [start:cat-test-txt]
```bash 
$ cat test.txt
Hello world
```
# --8<-- [end:cat-test-txt]
