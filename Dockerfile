FROM openjdk:27-ea-oraclelinux9
ADD target/docker-demo.jar docker-demo.jar
ENTRYPOINT ["java","-jar","/docker-demo.jar"]