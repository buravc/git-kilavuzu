# --8<-- [start:git-tree-1]
```bash 
$ tree .git
.git
├── config
├── description
├── HEAD
├── hooks
│   ├── applypatch-msg.sample
│   ├── commit-msg.sample
│   ├── fsmonitor-watchman.sample
│   ├── post-update.sample
│   ├── pre-applypatch.sample
│   ├── pre-commit.sample
│   ├── pre-merge-commit.sample
│   ├── pre-push.sample
│   ├── pre-rebase.sample
│   ├── pre-receive.sample
│   ├── prepare-commit-msg.sample
│   ├── push-to-checkout.sample
│   ├── sendemail-validate.sample
│   └── update.sample
├── index
├── info
│   └── exclude
├── logs
│   ├── HEAD
│   └── refs
│       ├── heads
│       │   ├── dal-A
│       │   ├── dal-B
│       │   ├── main
│       │   ├── yeni-bir-branch
│       │   ├── yeni-branch
│       │   └── yeni-branch-2
│       └── remotes
├── objects
│   ├── 0d
│   │   └── 3ca3b82801797f1e43b13e13ff848745f2508e
│   ├── 13
│   │   ├── 549709c8a35740ffd8e8807d8d3316f9954ef6
│   │   └── bb9e0ba6d7bd9e4087f7cdb110080c10a8249d
│   ├── 2c
│   │   └── 6d14409ca7bd4bedf69b1fa2b7df7e673c3c8b
│   ├── 2f
│   │   └── 7e211bb943c48fa21d1cd73a0a0ba8ca871f39
│   ├── 31
│   │   └── f3baeb6bda14f8f02d304999e16df9de956377
│   ├── 36
│   │   └── 7ea1ad26695c83c96a6632563f1118344897c0
│   ├── 3b
│   │   └── e11c69355948412925fa5e073d76d58ff3afd2
│   ├── 40
│   │   └── 1ce7dbd55d28ea49c1c2f1c1439eb7d2b92427
│   ├── 51
│   │   └── ea971882184ee5986f440bb9e0ed2baea702ae
│   ├── 52
│   │   └── ac9288adff03447ba51676ca78a830d8b69ccb
│   ├── 54
│   │   └── 8d693ac499dffbba69340bfb0b25593473883a
│   ├── 5f
│   │   └── a69300068f328394fc9765d3a3843d0d6d321a
│   ├── 71
│   │   ├── 120a132264f1823a4bf4a42298d1586548716b
│   │   └── 5c93c23f99d7602214513ee965ee0fe0514aff
│   ├── 77
│   │   └── 7f68a6ba056e0bdfd674c3f8646ea2f9b04520
│   ├── 78
│   │   └── 9492681e6b0d56b1fe142431bae464d630f2d3
│   ├── 7e
│   │   └── b6f87f0dae69f6a068004caea18eb0b3868e51
│   ├── 80
│   │   └── 2992c4220de19a90767f3000a79a31b98d0df7
│   ├── 8c
│   │   └── d6f22b567ea17f6ac6f69e20e26d5824a47e7f
│   ├── 8d
│   │   └── d87969d42bdfaf073149647688bf2c5c0db840
│   ├── 8f
│   │   └── d49c9aea2c510c690e234cbd31938b188f4f81
│   ├── 95
│   │   └── e7356f75c2d844d9d1d7ba42fd5b40a5fd5ecf
│   ├── 99
│   │   └── da6674f09ff4194a01b3380fb5591537a9384c
│   ├── 9a
│   │   └── 63d6499f568868f73613412f881a770f33342d
│   ├── b5
│   │   └── b6c0910ab195204dec707b3370b8e70b47eabc
│   ├── ce
│   │   └── f4e449c3fcab258db56a2954cc144ae3271584
│   ├── da
│   │   └── 9d8ba3ad2add71c335a269ada194455a06831e
│   ├── dc
│   │   └── 2243f197f26719f94687238bb0f9310da223d2
│   ├── de
│   │   └── 0bdc0759033f9b112a4d874c8aaff95959f198
│   ├── eb
│   │   └── 02546d739a068296f32e1340f4754bbbd3e922
│   ├── ee
│   │   └── cd54119ac8e595f09320298ff46bab502d5861
│   ├── ef
│   │   └── f951c5a4da7490ac1022508fc98ee4533897db
│   ├── fe
│   │   └── b734c0ff9cfb31293961003c8bcf6fadd86514
│   └── info
├── packed-refs
└── refs
    ├── heads
    │   ├── dal-A
    │   ├── dal-B
    │   ├── main
    │   ├── yeni-bir-branch
    │   ├── yeni-branch
    │   └── yeni-branch-2
    ├── remotes
    └── tags

45 directories, 67 files

```
# --8<-- [end:git-tree-1]
# --8<-- [start:commit-vs-object-count]
```bash 
$ git log --all --oneline | wc -l
      13
#     ^^ repository'deki toplam commit sayimiz

$ find .git/objects -type f | wc -l
      34
#     ^^ repository'deki toplam obje sayimiz

```
# --8<-- [end:commit-vs-object-count]
# --8<-- [start:ls-commit-object]
```bash 
$ ls .git/objects/78/9492681e6b0d56b1fe142431bae464d630f2d3
.git/objects/78/9492681e6b0d56b1fe142431bae464d630f2d3

```
# --8<-- [end:ls-commit-object]
# --8<-- [start:cat-file-head-commit]
```bash 
$ git cat-file commit 789492681e6b0d56b1fe142431bae464d630f2d3
tree eecd54119ac8e595f09320298ff46bab502d5861
parent eb02546d739a068296f32e1340f4754bbbd3e922
author <username> <email> 1746280401 +0200
committer <username> <email> 1746280401 +0200

squash merge dal-B

```
# --8<-- [end:cat-file-head-commit]
