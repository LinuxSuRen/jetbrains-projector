[![Docker Pulls](https://img.shields.io/docker/pulls/surenpi/kubesphere-goland.svg)](https://hub.docker.com/r/surenpi/kubesphere-goland/tags)

JetBrains Projector

# Get started

You can start it via docker or helm chat.

## Docker

```
docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/data/goland:/root \
    -p 30000:8887 surenpi/kubesphere-goland
```

```
docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/data/idea-c:/root \
    -p 30001:8887 surenpi/kubesphere-idea-c
```

```
docker run -v /var/run/docker.sock:/var/run/docker.sock-v /var/data/webstorm:/root \
    -p 30002:8887 surenpi/kubesphere-webstorm
```

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
