# scala-sbt-zulu-openjdk-alpine
Scala sbt and zulu-openjdk-alpine


[![Docker Stars](https://img.shields.io/docker/stars/harrylaou/scala-sbt-zulu-openjdk-alpine.svg?style=flat-square)](https://hub.docker.com/r/harrylaou/scala-sbt-zulu-openjdk-alpine/)
[![Docker Pulls](https://img.shields.io/docker/pulls/harrylaou/scala-sbt-zulu-openjdk-alpine.svg?style=flat-square)](https://hub.docker.com/r/harrylaou/scala-sbt-zulu-openjdk-alpine/)
[![Build Status](https://img.shields.io/github/actions/workflow/status/harrylaou/scala-sbt-zulu-openjdk-alpine/docker-build.yml?branch=master&style=flat-square)](https://github.com/harrylaou/scala-sbt-zulu-openjdk-alpine/actions/workflows/docker-build.yml)

# scala-sbt-zulu-openjdk-alpine

A minimal sbt alpine docker image based on  and [azul/zulu-openjdk-alpine:17](https://hub.docker.com/r/azul/zulu-openjdk-alpine/tags?page=1&name=11)

current environment parameters (can be configured)

```dockerfile
SCALA_VERSION=2.13.16
SBT_VERSION=1.11.4
```



## Build 

```shell
docker build --platform linux/amd64 --tag=harrylaou/scala-sbt-zulu-openjdk-alpine:xxx .
```

`--platform linux/amd64` is necessary to build the correct version to be run for gitlab ci

```shell
docker push harrylaou/scala-sbt-zulu-openjdk-alpine:xxx
```

## Automated Builds

This image is automatically built daily to ensure it stays updated with the latest base image security patches and updates. The automated build system:

- **Daily Builds**: Runs every day at 2 AM UTC
- **Smart Detection**: Only rebuilds when the base image `azul/zulu-openjdk-alpine:17` has been updated
- **Multi-Platform**: Builds for both `linux/amd64` and `linux/arm64` platforms
- **Version Tagging**: Creates multiple tags for each build:
  - `latest` - Most recent build
  - `YYYY-MM-DD` - Date-based tag for the build
  - `SCALA_VERSION-SBT_VERSION` - Version-specific tag
  - `SCALA_VERSION-SBT_VERSION-YYYY-MM-DD` - Combined version and date tag

### Manual Build Trigger

You can manually trigger a build through the GitHub Actions interface or check if a rebuild is needed:

```shell
# Check if base image has been updated (requires Docker and jq)
./.github/workflows/check-base-update.sh
```

### Build Status

Current build status and history can be viewed in the [GitHub Actions tab](https://github.com/harrylaou/scala-sbt-zulu-openjdk-alpine/actions/workflows/docker-build.yml).





