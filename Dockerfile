FROM registry.jetbrains.team/p/prj/containers/projector-goland

USER root

ARG GO_VERSIOIN=1.14.4

RUN apt-get update
RUN apt-get install vim curl wget git gcc make -y && \
	curl -L https://github.com/linuxsuren/http-downloader/releases/latest/download/hd-linux-amd64.tar.gz | tar xzv && \
	mv hd /usr/local/bin && \
	curl -O https://dl.google.com/go/go$GO_VERSIOIN.linux-amd64.tar.gz && \
	tar xvf go$GO_VERSIOIN.linux-amd64.tar.gz && \
	mv go /usr/local

RUN hd install linuxsuren/ks && \
	rm -rf ks-linux-amd64.tar.gz && \
	hd install cli/cli && \
	rm -rf gh_1.8.1_linux_amd64.tar.gz && \
	curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
	mv kubectl /usr/local/bin && \
	chmod +x /usr/local/bin/kubectl

ENV GOPATH /home/projector-user/.go
ENV GOROOT /usr/local/go
ENV GOPROXY https://goproxy.io
ENV PATH $PATH:$GOROOT/bin

USER projector-user
