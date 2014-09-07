# Youtrack Dockerized

Une image docker de l'application web [Youtrack](http://www.jetbrains.com/youtrack) de [JetBrains](http://www.jetbrains.com/).

## Docker Hub Registry

Le repo Docker [sebmartin/youtrack-dockerized](https://registry.hub.docker.com/u/sebmartin/youtrack-dockerized) est paramétré pour construire automatiquement l'image Docker à partir du repo GitHub [seb-martin/youtrack-dockerized](https://github.com/seb-martin/youtrack-dockerized).

### Pull du repository

```
docker pull sebmartin/youtrack-dockerized
```

### Exécution du conteneur

```
docker run --name="youtrack" -v /path/to/database/directory:/root/teamsysdata -v /path/to/backups/directory:/root/teamsysdata-backup -p 83:80 -d sebmartin/youtrack-dockerized
```

Ajuster les paramètres de la commande :

* Ajuster `-v /path/to/database/directory:/root/teamsysdata`. Ce paramètre monte le volume `/path/to/database/directory` de la machine hôte sur le volume `/root/teamsysdata` du conteneur docker.
* Ajuster `-v /path/to/backups/directory:/root/teamsysdata-backup`. Ce paramètre monte le volume `/path/to/backups/directory` de la machine hôte sur le volume `/root/teamsysdata-backup` du conteneur docker.
* Ajuster `-p 83:80`. Ce paramètre expose le port `80` du conteneur docker sur le port `83` de la machine hôte.

## GitHub

Les sources de l'image sont clonable depuis le repo [seb-martin/youtrack-dockerized](https://github.com/seb-martin/youtrack-dockerized).

### Clone du repository

```
git clone https://github.com/seb-martin/youtrack-dockerized.git
```

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