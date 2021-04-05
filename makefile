build:
	docker build . -t surenpi/kubesphere-goland

push:
	docker push surenpi/kubesphere-goland

helm-install:
	helm install ks-goland ks-goland --set service.type=NodePort --set image.tag=latest

helm-uninstall:
	helm delete ks-goland
