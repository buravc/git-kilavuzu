# --8<-- [start:create-sub-dirs]
```bash 
$ mkdir alt-dizinim && echo "bu bir testtir" > alt-dizinim/alt-dosya.txt

$ mkdir alt-dizinim/bir-baska-alt-dizin && echo "baska bir test" > alt-dizinim/bir-baska-alt-dizin/baska-alt-dosya.txt

$ git add . && git commit -m "alt dizinlerle dosyalar olusturdum"
[dal-A 255a1c9] alt dizinlerle dosyalar olusturdum
 2 files changed, 2 insertions(+)
 create mode 100644 alt-dizinim/alt-dosya.txt
 create mode 100644 alt-dizinim/bir-baska-alt-dizin/baska-alt-dosya.txt


```
# --8<-- [end:create-sub-dirs]
# --8<-- [start:tree-sub-dirs]
```bash 
# repository dizinimizin son haline bakalim
$ tree .
.
├── alt-dizinim
│   ├── alt-dosya.txt
│   └── bir-baska-alt-dizin
│       └── baska-alt-dosya.txt
├── test-2.txt
└── test.txt

3 directories, 4 files

```
# --8<-- [end:tree-sub-dirs]
# --8<-- [start:cat-file-tree-1]
```bash 
$ git cat-file -p 255a1c9
tree 49664afeafb81dd195da85101c35bfdb18fd277b
parent 789492681e6b0d56b1fe142431bae464d630f2d3
author <username> <email> 1747583059 +0200
committer <username> <email> 1747583059 +0200

alt dizinlerle dosyalar olusturdum

$ git cat-file -p 49664afeafb81dd195da85101c35bfdb18fd277b
040000 tree 3b863a1570fbd49a0edddaa19e139d914e8fe5de	alt-dizinim
100644 blob 3be11c69355948412925fa5e073d76d58ff3afd2	test-2.txt
100644 blob 52ac9288adff03447ba51676ca78a830d8b69ccb	test.txt

```
# --8<-- [end:cat-file-tree-1]
# --8<-- [start:alt-dizinim-cat-file]
```bash 
$ git cat-file -p 3b863a1570fbd49a0edddaa19e139d914e8fe5de
100644 blob 855deee8a88ad1a89440c6e868e326e14c2d55a4	alt-dosya.txt
040000 tree b23821ed42fc628b9cdd2d16bf14ed3c7f5bffb6	bir-baska-alt-dizin

```
# --8<-- [end:alt-dizinim-cat-file]
