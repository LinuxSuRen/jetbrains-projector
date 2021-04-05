build:
	docker build . -t surenpi/kubesphere-goland
build-idea-c:
	docker build . -t surenpi/kubesphere-idea-c -f Dockerfile-idea-c

push:
	docker push surenpi/kubesphere-goland
push-idea-c:
	docker push surenpi/kubesphere-idea-c

helm-install:
	helm install ks-goland ks-goland --set service.type=NodePort --set image.tag=latest

helm-uninstall:
	helm delete ks-goland

helm-package:
	helm package ks-goland -d bin
