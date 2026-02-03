FROM alpine:3.23

# JDK 版本号
ARG JAVA_VERSION=jdk17.0.6

WORKDIR /usr/local/java

# 添加JDK到容器中并解压缩
ADD ${JAVA_VERSION}.tar.gz /usr/local/java

# 更换国内源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
&& apk upgrade --update-cache

# 安装时区
RUN apk add --no-cache tzdata \
&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV JAVA_HOME=/usr/local/java/${JAVA_VERSION}
ENV PATH $PATH:/usr/local/java/${JAVA_VERSION}/bin

CMD ["java","-version"]
