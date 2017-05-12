FOLDER_PATH = ~/TW_Projects/registro_alunos

images:
	docker-compose build

api-bash:
	docker run -t -i -v $(FOLDER_PATH):/webapp registroalunos_api /bin/bash

api-tests:
	docker run -t -i -v $(FOLDER_PATH):/webapp registroalunos_api rspec

app-api:
	docker-compose up api

app:
	docker-compose up
