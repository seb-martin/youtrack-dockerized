# Nexus Dockerized

Une image docker de l'application web [Nexus OSS](http://www.sonatype.org/nexus) de [Sonatype](http://www.sonatype.org).




## GitHub

Les sources de l'image sont clonables depuis le repo [seb-martin/nexus-dockerized](https://github.com/seb-martin/nexus-dockerized).

### Clone du repository

```
git clone https://github.com/seb-martin/nexus-dockerized.git
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
> make DATA_DIR=/path/to/data_dir run
```

Exécuter le conteneur docker en spécifiant un port alternatif (ici 8080)

```
> make DATA_DIR=/path/to/data_dir PORT=8080 run
```

Stopper l'exécution du conteneur docker

```
> make stop
```
