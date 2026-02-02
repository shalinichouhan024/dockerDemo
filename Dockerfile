#FROM openjdk:27-ea-oraclelinux9
#ADD target/docker-demo.jar docker-demo.jar
#ENTRYPOINT ["java","-jar","/docker-demo.jar"]

# Stage 1: Build the JAR
FROM maven:3.9.3-eclipse-temurin-17 AS build

WORKDIR /app

# Copy pom.xml and download dependencies (cached)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build Spring Boot JAR
RUN mvn clean package -DskipTests

# Stage 2: Runtime
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy JAR from build stage
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]