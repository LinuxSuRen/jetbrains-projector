[![Docker Pulls](https://img.shields.io/docker/pulls/surenpi/kubesphere-goland.svg)](https://hub.docker.com/r/surenpi/kubesphere-goland/tags)

JetBrains Projector

# Get started

You can start it via docker or helm chat.

## Docker

`docker run -p 8887:8887 surenpi/kubesphere-goland`

`docker run -p 8887:8887 surenpi/kubesphere-idea-c`

## Helm

`helm install jetbrains jetbrains --set service.type=NodePort --set image.tag=latest`

### Install IdeaU

```
helm install ideau jetbrains --set service.type=NodePort \
    --set image.repository=surenpi/kubesphere-idea-u,image.tag=latest
```

### Install IdeaC

```
helm install ideac jetbrains --set service.type=NodePort \
    --set image.repository=surenpi/kubesphere-idea-c,image.tag=latest
```
