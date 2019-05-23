# amazonlinux-with-golang-node

In a container of [this image](https://hub.docker.com/r/rigidrabbit/amazonlinux-with-golang-node/) you will have golang 1.12.5 and node 8.15.1 installed and ready to use.

This image is based on [the official Amazon Linux docker image](https://hub.docker.com/r/library/amazonlinux/) and is
supposed to be used for building applications which will be deployed on Amazon Linux EC2 instance.

If you are developing golang and/or nodejs applications and also you are planning to deploy them onto EC2 instances
of Amazon Linux, it might be helpful for your development, testing and production to use docker with this image
since the golang and nodejs packages provided by the standard yum repoistory of Amazon Linux are fairly old
and you would not want to use them.

# Supported tags and respective Dockerfile links

* latest [Dockerfile](https://github.com/rigidrabbit/amazonlinux-with-golang-node/blob/master/Dockerfile)

# How to Use

    [host]# cd your_project
    [host]# docker run -it -v `pwd`:/go/src/your_project rigidrabbit/amazonlinux-with-golang-node /bin/bash
    [docker]# cd /go/src/your_project
    [docker]# ... whatever you want with golang and/or nodejs ...

# GOPATH

`GOPATH` is defined as `/go`. So you should have your golang application materials placed at
`/go/src/your_project` directory.

# EXPOSE

No ports exposed.

# CMD/ENTRYPOINT

No CMD/ENTRYPOINT defined.

# IMPORTANT NOTICE

Note that this docker image supports only the x86_64 architecture since this image is based on and is supposed to be
used with AmazonLinux EC2 instance.

