IMG_TAG=sebmartin/nexus-dockerized
CONTAINER_NAME=nexus

PORT=80

DATA_DIR=


build: 
	@echo "$@ $(IMG_TAG)"
	@docker build -t $(IMG_TAG) .


run:
	@echo "$@ $(CONTAINER_NAME):$(IMG_TAG) [DATA_DIR=$(DATA_DIR)]"

ifeq ("$(wildcard $(DATA_DIR))", "")
	@echo "Répertoire des données non spécifié ou inexistant"
	@echo "Précisez le répertoire des données à utiliser en définissant la variable d'environnement DATA_DIR"
	@exit 1
endif

	@docker run -d --name="$(CONTAINER_NAME)" -v $(DATA_DIR):/usr/local/sonatype-work/nexus -p $(PORT):80 $(IMG_TAG)

stop:
	@echo "$@ $(CONTAINER_NAME):$(IMG_TAG)"
	@docker kill $(CONTAINER_NAME)
	@docker rm $(CONTAINER_NAME)

clean:
	@echo "$@ $(IMG_TAG)"
	@docker rmi $(IMG_TAG)
