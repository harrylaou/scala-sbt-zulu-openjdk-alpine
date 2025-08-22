FROM  azul/zulu-openjdk-alpine:17
LABEL maintainer="harry@talos.software"
ENV SCALA_VERSION=2.13.16 \
  SCALA_HOME=/usr/share/scala \
  SBT_VERSION=1.11.4

WORKDIR /workspace

RUN \
  apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
  apk add --no-cache bash && \
  cd "/tmp" && \
  wget "https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \
  tar xzf "scala-${SCALA_VERSION}.tgz" && \
  mkdir "${SCALA_HOME}" && \
  rm "/tmp/scala-${SCALA_VERSION}/bin/"*.bat && \
  mv "/tmp/scala-${SCALA_VERSION}/bin" "/tmp/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
  ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
  apk del .build-dependencies && \
  rm -rf "/tmp/"*

RUN \
  echo "$SCALA_VERSION $SBT_VERSION" && \
  apk add --no-cache bash curl bc ca-certificates && \
  update-ca-certificates && \
  scala -version && \
  scalac -version && \
  curl -fsL https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz | tar xfz - -C /usr/local && \
  (cd /usr/local && SBT_DIR=$(ls -d sbt* | head -1) && if [ "$SBT_DIR" != "sbt" ] && [ -n "$SBT_DIR" ]; then mv "$SBT_DIR" sbt; fi) && \
  ln -s /usr/local/sbt/bin/* /usr/local/bin/ && \
  apk del curl && \
  sbt --allow-empty sbtVersion
