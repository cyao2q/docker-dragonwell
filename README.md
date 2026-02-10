# docker-dragonwell

alibaba dragonwell jdk

## dragonwell

<https://github.com/alibaba/dragonwell8>

<https://hub.docker.com/r/forchangyao/dragonwell>

## 构建步骤

请提前使用`jdk8_clear.cmd`文件清理jdk非必要文件

拷贝 jdk*.zip 文件到jdk目录下面 解压缩

```bash
unzip -oq *.zip

chmod -R 777 jdk1.8.0_472
```

### docker build

```bash

docker build -t forchangyao/dragonwell:1.8.0_472 .

docker tag forchangyao/dragonwell:1.8.0_472 forchangyao/dragonwell:8

docker push -a forchangyao/dragonwell

```
### docker run

```bash
# 验证
docker run --rm -it forchangyao/dragonwell:1.8.0_472 sh

java -XshowSettings:properties -version

java -version

# +0800 时区验证
date -R
```
