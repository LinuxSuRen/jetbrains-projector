Goland for KubeSphere

# Get started

You can start it via docker or helm chat.

## Docker

`docker run -p 8887:8887 surenpi/kubesphere-goland`

## Helm

`helm install ks-goland ks-goland --set service.type=NodePort, image.tag=latest`
