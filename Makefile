.PHONY: sync

sync:
	ssh-add keys/gcp_automatic_deploy
	scp -i keys/gcp_automatic_deploy confs/traefik.toml root@35.197.34.119:/deep-shirt/confs/
	scp -i keys/gcp_automatic_deploy docker/docker-compose.yaml root@35.197.34.119:/deep-shirt/docker/
	scp -i keys/gcp_automatic_deploy envs/backend.env root@35.197.34.119:/deep-shirt/envs/
	scp -i keys/gcp_automatic_deploy keys/firebase-service-account.json root@35.197.34.119:/deep-shirt/keys/
