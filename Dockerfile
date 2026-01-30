FROM frolvlad/alpine-glibc

ENV LANG=C.UTF-8

# JDK 版本号
ARG JAVA_VERSION=jdk1.8.0_472

# 指定工作目录
WORKDIR /usr/local/java

# 添加JDK到容器中
COPY jdk1.8.0_472 /usr/local/java/

# 更换国内源 + 安装依赖（tzdata时区+glibc-langpack-en字符集核心依赖）
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
&& apk upgrade --update-cache \
&& apk add --no-cache tzdata

# 配置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# JDK环境变量
ENV JAVA_HOME=/usr/local/java/
ENV PATH $PATH:${JAVA_HOME}/bin

CMD ["java","-version"]
