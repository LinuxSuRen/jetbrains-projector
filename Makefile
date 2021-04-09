build:
	docker build . -t surenpi/kubesphere-goland
build-idea-c:
	docker build . --build-arg IMAGE=projector-idea-c -t surenpi/kubesphere-idea-c -f Dockerfile-idea
build-idea-u:
	docker build . --build-arg IMAGE=projector-idea-u -t surenpi/kubesphere-idea-u -f Dockerfile-idea
build-webstorm:
	docker build . -t surenpi/kubesphere-webstorm -f Dockerfile-webstorm

idea-c: build-idea-c push-idea-c
idea-u: build-idea-u push-idea-u

push:
	docker push surenpi/kubesphere-goland
push-idea-c:
	docker push surenpi/kubesphere-idea-c
push-idea-u:
	docker push surenpi/kubesphere-idea-u
push-webstorm:
	docker push surenpi/kubesphere-webstorm

helm-install:
	helm install jetbrains jetbrains --set service.type=NodePort --set image.tag=latest

helm-uninstall:
	helm delete jetbrains

helm-package:
	helm package jetbrains -d bin
