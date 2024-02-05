# scala-sbt-zulu-openjdk-alpine
Scala sbt and zulu-openjdk-alpine


[![Docker Stars](https://img.shields.io/docker/stars/harrylaou/scala-sbt-zulu-openjdk-alpine.svg?style=flat-square)](https://hub.docker.com/r/harrylaou/scala-sbt-zulu-openjdk-alpine/)

[![Docker Pulls](https://img.shields.io/docker/pulls/harrylaou/scala-sbt-zulu-openjdk-alpine.svg?style=flat-square)](https://hub.docker.com/r/harrylaou/scala-sbt-zulu-openjdk-alpine/)

# scala-sbt-zulu-openjdk-alpine

A minimal sbt alpine docker image based on  and [azul/zulu-openjdk-alpine:17](https://hub.docker.com/r/azul/zulu-openjdk-alpine/tags?page=1&name=11)

current environment parameters (can be configured)

```dockerfile
SCALA_VERSION=2.13.12
SBT_VERSION=1.9.8
```



## Build 

```shell
docker build --platform linux/amd64 --tag=harrylaou/scala-sbt-zulu-openjdk-alpine:xxx .
```

`--platform linux/amd64` is necessary to build the correct version to be run for gitlab ci

```shell
docker push harrylaou/scala-sbt-zulu-openjdk-alpine:xxx
```





