build:
	docker build . -t surenpi/kubesphere-goland
build-idea-c:
	docker build . -t surenpi/kubesphere-idea-c -f Dockerfile-idea-c

push:
	docker push surenpi/kubesphere-goland
push-idea-c:
	docker push surenpi/kubesphere-idea-c

helm-install:
	helm install jetbrains jetbrains --set service.type=NodePort --set image.tag=latest

helm-uninstall:
	helm delete jetbrains

helm-package:
	helm package jetbrains -d bin
