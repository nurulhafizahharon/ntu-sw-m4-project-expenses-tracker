FROM maven:3.6.3 AS maven

LABEL MAINTAINER=""

WORKDIR /usr/src/app

COPY . /usr/src/app/

RUN mvn package

FROM adoptopenjdk/openjdk11:alpine-jre

ARG JAR_FILE=spring-boot-api-tutorial.jar

WORKDIR /opt/app

COPY --from=maven /usr/src/app/target/${JAR_FILE} /opt/app/

ENTRYPOINT ["java", "-jar", "spring-boot-api-tutorial.jar"]