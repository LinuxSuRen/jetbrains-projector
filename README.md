[![Docker Pulls](https://img.shields.io/docker/pulls/surenpi/kubesphere-goland.svg)](https://hub.docker.com/r/surenpi/kubesphere-goland/tags)

Goland for KubeSphere

# Get started

You can start it via docker or helm chat.

## Docker

`docker run -p 8887:8887 surenpi/kubesphere-goland`

## Helm

`helm install ks-goland ks-goland --set service.type=NodePort --set image.tag=latest`
