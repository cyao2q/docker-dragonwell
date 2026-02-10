FROM alpine:3.9

ENV LANG C.UTF-8

RUN { \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
		echo; \
		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
	} > /usr/local/bin/docker-java-home \
	&& chmod +x /usr/local/bin/docker-java-home
	
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/jre

ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

ENV JAVA_VERSION 8u275

ENV JAVA_ALPINE_VERSION 8.275.01-r0

RUN set -x && apk add --no-cache openjdk8-jre="$JAVA_ALPINE_VERSION" tzdata fontconfig ttf-dejavu

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
