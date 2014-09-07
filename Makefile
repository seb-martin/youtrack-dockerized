IMG_TAG=sebmartin/youtrack
CONTAINER_NAME=youtrack

PORT=80

DATA_DIR=
BACKUP_DIR=


build: 
	@echo "$@ $(IMG_TAG)"
	@docker build -t $(IMG_TAG) .


run:
	@echo "$@ $(CONTAINER_NAME):$(IMG_TAG) [DATA_DIR=$(DATA_DIR) ; BACKUP_DIR=$(BACKUP_DIR)]"

ifeq ("$(wildcard $(DATA_DIR))", "")
	@echo "Répertoire des données non spécifié ou inexistant"
	@echo "Précisez le répertoire des données à utiliser en définissant la variable d'environnement DATA_DIR"
	@exit 1
endif

ifeq ("$(wildcard $(BACKUP_DIR))", "")
	@echo "Répertoire des sauvegardes non spécifié ou inexistant"
	@echo "Précisez le répertoire des sauvegardes à utiliser en définissant la variable d'environnement BACKUP_DIR"
	@exit 1
endif

	@docker run -d --name="$(CONTAINER_NAME)" -v $(DATA_DIR):/root/teamsysdata -v $(BACKUP_DIR):/root/teamsysdata-backup -p $(PORT):80 $(IMG_TAG)

stop:
	@echo "$@ $(CONTAINER_NAME):$(IMG_TAG)"
	@docker kill $(CONTAINER_NAME)
	@docker rm $(CONTAINER_NAME)

clean:
	@echo "$@ $(IMG_TAG)"
	@docker rmi $(IMG_TAG)


