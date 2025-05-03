# Git Kılavuzu 

Git'i bildigim kadari ile anlatmaya calistigim bir kilavuz.

https://buravc.github.io/git-kilavuzu


## Calistirmak Icin

```
# Kurulum
$ pip3 install mkdocs-material pymdown-extensions mkdocs-macros-plugin

# Calistirmak
$ mkdocs serve
```

## Kod Snippet'leri

Kod snippetlerini generate ettirmek icin `snippets/generate.sh` scriptini calistirin. Bu script `snippets.yaml` dosyasini okuyup adim adim isleyerek snippetleri bastan olusturacaktir.

Snippetler'de `yaml` dosyalarini isleyen `yq`'nun [kislyuk/yq](https://github.com/kislyuk/yq) dagitimi kullanildi.
