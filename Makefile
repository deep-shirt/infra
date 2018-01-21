.PHONY: sync www

sync:
	ssh-add keys/gcp_automatic_deploy
	scp -i keys/gcp_automatic_deploy confs/{nginx.conf,server.conf,traefik.toml} root@35.197.34.119:/deep-shirt/confs/
	scp -i keys/gcp_automatic_deploy docker/docker-compose.yaml root@35.197.34.119:/deep-shirt/docker/
	scp -i keys/gcp_automatic_deploy keys/firebase-service-account.json root@35.197.34.119:/deep-shirt/keys/

www:
	ssh-add keys/gcp_automatic_deploy
	scp -i keys/gcp_automatic_deploy -r ../react-web/build/* root@35.197.34.119:/deep-shirt/www/
