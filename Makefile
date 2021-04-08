build:
	docker build . -t surenpi/kubesphere-goland
build-idea-c:
	docker build . --build-arg IMAGE=projector-idea-c -t surenpi/kubesphere-idea-c -f Dockerfile-idea-u
build-idea-u:
	docker build . --build-arg IMAGE=projector-idea-u -t surenpi/kubesphere-idea-u -f Dockerfile-idea-u

push:
	docker push surenpi/kubesphere-goland
push-idea-c:
	docker push surenpi/kubesphere-idea-c
push-idea-u:
	docker push surenpi/kubesphere-idea-u

helm-install:
	helm install jetbrains jetbrains --set service.type=NodePort --set image.tag=latest

helm-uninstall:
	helm delete jetbrains

helm-package:
	helm package jetbrains -d bin
