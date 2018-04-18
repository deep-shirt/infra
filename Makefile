.PHONY: sync www

sync:
	ssh-add keys/gcp_automatic_deploy
	scp -i keys/gcp_automatic_deploy confs/{nginx.conf,server.conf} root@35.202.173.61:/deep-shirt/confs/
	scp -i keys/gcp_automatic_deploy docker/docker-compose.yaml root@35.202.173.61:/deep-shirt/docker/
	scp -i keys/gcp_automatic_deploy keys/firebase-service-account.json root@35.202.173.61:/deep-shirt/keys/

www:
	ssh-add keys/gcp_automatic_deploy
	scp -i keys/gcp_automatic_deploy -r ../react-web/build/* root@35.202.173.61:/deep-shirt/www/
