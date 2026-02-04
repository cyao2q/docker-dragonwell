docker build -f cyaostar.openjdk.8-jre.alpine.Dockerfile -t forchangyao/openjdk:8-jre-alpine .

docker run --rm -it forchangyao/openjdk:8-jre-alpine sh

docker run --rm forchangyao/openjdk:8-jre-alpine java -XshowSettings:properties -version

docker push -a forchangyao/openjdk
