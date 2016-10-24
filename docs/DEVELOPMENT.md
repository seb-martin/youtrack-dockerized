
# Vagrant VirtualBox

Requires Vagrant >= 1.8.6 and Virtual Box

```
vagrant plugin install vagrant-vbguest
vagrant up --provider virtualbox
vagrant ssh
cd /vagrant
```

# Linux Natif

Construire l'image docker

```
make build
```

Exécuter le conteneur docker avec le port par défaut (8080)

```
make DATA_DIR=/path/to/data_dir BACKUP_DIR=/path/to/backup_dir YOUTRACK_DIR=/path/to/youtrack_dir run
```

Exécuter le conteneur docker en spécifiant un port alternatif (ici 8081)

```
make DATA_DIR=/path/to/data_dir BACKUP_DIR=/path/to/backup_dir YOUTRACK_DIR=/path/to/youtrack_dir PORT=8081 run
```

Stopper l'exécution du conteneur docker

```
make stop
```
