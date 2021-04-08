FROM bitnami/kubectl:1.16.15 as kubectl
FROM golang:1.16.3-buster as golang

RUN tar czf /go.tar.gz /usr/local/go

FROM registry.jetbrains.team/p/prj/containers/projector-goland

USER root

COPY --from=golang /go.tar.gz go.tar.gz
COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/kubectl

RUN apt-get update -y
RUN apt-get install vim curl wget git gcc make -y && \
	curl -L https://github.com/linuxsuren/http-downloader/releases/latest/download/hd-linux-amd64.tar.gz | tar xzv && \
	mv hd /usr/local/bin && \
	git config --global core.editor 'vim' && \
	tar xzf go.tar.gz && \
	rm -rf go.tar.gz

RUN apt-get install apt-transport-https ca-certificates gnupg lsb-release -y && \
	curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
	echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
	apt-get update && \
	apt-get install docker-ce-cli containerd.io

RUN hd install linuxsuren/ks && \
	rm -rf ks-linux-amd64.tar.gz && \
	hd install cli/cli && \
	gh config set editor vim

ENV GOPATH /root/.go
ENV GOROOT /usr/local/go
ENV GOPROXY https://goproxy.io
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin
