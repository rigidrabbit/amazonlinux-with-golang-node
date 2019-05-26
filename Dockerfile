FROM amazonlinux:1

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
	    SHA256='aea86e3c73495f205929cfebba0d63f1382c8ac59be081b6351681415f4063cf'; \
	    URL='https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz'; \
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
	    SHA256='5643b54c583eebaa40c1623b16cba4e3955ff5dfdd44036f6bafd761160c993d'; \
	    URL='https://nodejs.org/dist/v8.15.1/node-v8.15.1-linux-x64.tar.xz'; \
	    \cd /tmp && \
	    \wget -O node.tar.xz "$URL" && \
	    \echo "$SHA256 *node.tar.xz" | \sha256sum -c - && \
	    \tar -C /usr/local -xJf node.tar.xz --strip-components 1 && \
	    \chown -R root:root /usr/local/* && \
	    \chmod -R go-w /usr/local/* && \
	    \rm node.tar.xz && \
	    \node --version \
	);

ENV GOLANG_VERSION=1.12.5 \
    GOROOT=/usr/local/go \
    GOPATH=/go \
    PATH=/go/bin:/usr/local/go/bin:$PATH
