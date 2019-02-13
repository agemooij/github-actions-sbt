FROM openjdk:8-jre-alpine

LABEL "com.github.actions.name"="sbt"
LABEL "com.github.actions.description"="Executes sbt build commands"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="blue"

ENV sbt_version 1.2.8
ENV sbt_home /usr/local/sbt
ENV PATH ${PATH}:${sbt_home}/bin

COPY bintray-credentials.sbt /github/home/.sbt/1.0/

RUN apk --no-cache --update add bash wget && mkdir -p "$sbt_home" && \
    wget -qO - --no-check-certificate "https://github.com/sbt/sbt/releases/download/v$sbt_version/sbt-$sbt_version.tgz" | tar xz -C $sbt_home --strip-components=1 && \
    apk del wget && \
    sbt sbtVersion

ENTRYPOINT ["sbt"]
