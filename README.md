# Youtrack Dokerized

## Prérequis ##

### Vagrant VirtualBox ###

```
> vagrant plugin install vagrant-vbguest
> vagrant up
> vagrant ssh
> cd /vagrant
```

### Linux Natif ###

Construire l'image docker

```
> make build
```

Exécuter le conteneur docker avec le port par défaut (80)

```
> make DATA_DIR=/path/to/data_dir BACKUP_DIR=/path/to/backup_dir run
```

Exécuter le conteneur docker en spécifiant un port alternatif (ici 8080)

```
> make DATA_DIR=/path/to/data_dir BACKUP_DIR=/path/to/backup_dir PORT=8080 run
```

Stopper l'exécution du conteneur docker

```
> make stop
```
