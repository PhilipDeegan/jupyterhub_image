# jupytercloud-project / jupyterhub_image


```bash
$ task
task: Available tasks for this project:
* init:       Initializes constructor and provisioner repositories
```

```bash
$ task init
task: [git_clone_if_not_exist] git clone --progress --verbose --single-branch --branch 'main' 'https://github.com/jupytercloud-project/image_build.git' '.constructor'
task: [git_clone_if_not_exist] git clone --progress --verbose --single-branch --branch 'main' 'https://github.com/jupytercloud-project/jupyterhub_provisioner.git' '.provisioner'
Cloning into '.constructor'...
Cloning into '.provisioner'...
POST git-upload-pack (352 bytes)
POST git-upload-pack (352 bytes)
POST git-upload-pack (167 bytes)
POST git-upload-pack (167 bytes)
remote: Enumerating objects: 106, done.
remote: Counting objects: 100% (106/106), done.
remote: Compressing objects: 100% (56/56), done.
remote: Total 106 (delta 53), reused 79 (delta 29), pack-reused 0
Receiving objects: 100% (106/106), 15.31 KiB | 5.10 MiB/s, done.
Resolving deltas: 100% (53/53), done.
remote: Enumerating objects: 308, done.
remote: Counting objects: 100% (308/308), done.
remote: Compressing objects: 100% (168/168), done.
task: [git_checkout_or_pull] cd '.constructor' &&  git pull 
remote: Total 308 (delta 132), reused 261 (delta 85), pack-reused 0
Receiving objects: 100% (308/308), 47.71 KiB | 2.51 MiB/s, done.
Resolving deltas: 100% (132/132), done.
task: [git_checkout_or_pull] cd '.provisioner' &&  git pull 
Already up to date.
Already up to date.
```

```bash

```