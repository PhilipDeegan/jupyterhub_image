# jupytercloud-project / jupyterhub_image

The purpose of this repository is to build a jupyterhub kvm image usable on an OpenStack cloud.
To achieve this goal, it uses the constructor repository [image_build](https://github.com/jupytercloud-project/image_build) hosting Packer code to build an OpenStack image and
the provisioner repository [jupyterhub_provisioner](https://github.com/jupytercloud-project/jupyterhub_provisioner) hosting Ansible code to provision the image.

The code from the constructor repository communicate with the code from the provisioner one through tasks.

## Usage

```bash
$ task
task: Available tasks for this project:
* init:       Initializes constructor and provisioner repositories
```

You must first clone the dependency repositories

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

You now inherit the dependencies tasks

```bash
 $ task
task: Available tasks for this project:
* init:                               Initializes constructor and provisioner repositories
* constructor:build:                  Constructor build task
* constructor:default:                list tasks      (aliases: constructor)
* constructor:fetch:                  Locally fetch the VM artifact from the build cloud
* constructor:get_ssh_key_path:       Return temporary ssh key path
* constructor:init:                   Constructor init task
* constructor:post-install:           post-install
* provisioner:configure:              Configure Jupyterhub instance with Ansible playbooks
* provisioner:install:                Prepare JupyterHub instance with Ansible playbooks
```

If you need to resynchronize with updated dependencies, re-execute the init task.

```bash
$ task init
task: Task "git_clone_if_not_exist" is up to date
task: Task "git_clone_if_not_exist" is up to date
task: [git_checkout_or_pull] cd '.constructor' &&  git pull 
task: [git_checkout_or_pull] cd '.provisioner' &&  git pull 
Déjà à jour.
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (1/1), done.
remote: Total 3 (delta 2), reused 3 (delta 2), pack-reused 0
Dépaquetage des objets: 100% (3/3), 278 octets | 139.00 Kio/s, fait.
Depuis https://github.com/jupytercloud-project/image_build
   ae9c8d4..574e2f1  main       -> origin/main
Mise à jour ae9c8d4..574e2f1
Fast-forward
 Taskfile.yml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
```

Start an image build

```bash
$ task constructor:build

```