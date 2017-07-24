FROM library/amazonlinux

RUN \set -eux; \
	\
    \yum update -y --security && \
    \yum install -y \
        g++ \
        gcc \
        libc6-dev \
        make \
        pkg-config \
        git \
        wget; \
	\
	( \
	    SHA256='1862f4c3d3907e59b04a757cfda0ea7aa9ef39274af99a784f5be843c80c6772'; \
	    URL='https://golang.org/dl/go1.8.3.linux-amd64.tar.gz'; \
	    \cd /tmp && \
	    \wget -O go.tgz "$URL" && \
	    \echo "$SHA256 *go.tgz" | \sha256sum -c - && \
	    \tar -C /usr/local -xzf go.tgz && \
	    \rm go.tgz && \
	    \export PATH="/usr/local/go/bin:$PATH" && \
	    \go version \
	); \
	\
	( \
	    SHA256='e68cc956f0ca5c54e7f3016d639baf987f6f9de688bb7b31339ab7561af88f41'; \
	    URL='https://nodejs.org/dist/v6.11.1/node-v6.11.1-linux-x64.tar.xz'; \
	    \cd /tmp && \
	    \wget -O node.tar.xz "$URL" && \
	    \echo "$SHA256 *node.tar.xz" | \sha256sum -c - && \
	    \tar -C /usr/local -xJf node.tar.xz --strip-components 1 && \
	    \chown -R root:root /usr/local/* && \
	    \chmod -R go-w /usr/local/* && \
	    \rm node.tar.xz && \
	    \node --version \
	);

ENV GOLANG_VERSION=1.8.3 \
    GOROOT=/usr/local/go \
    GOPATH=/go \
    PATH=/go/bin:/usr/local/go/bin:$PATH

CMD ["/bin/bash"]

