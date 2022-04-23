FROM maven:3.5.0-jdk-8-alpine as builder                         

MAINTAINER Yaojie.CHEN<yaojie.chen@uq.net.au>
 
COPY pom.xml .                                               
COPY src src
COPY configuration configuration                                                  

RUN mvn -B compile package
#ENTRYPOINT ["mvn","compile","package"]
 
FROM openjdk:8-jre-alpine                              

COPY --from=builder target/spring-boot-helloworld-0.0.1-SNAPSHOT.jar .
 
EXPOSE 8080
 
ENTRYPOINT ["java", "-jar", "spring-boot-helloworld-0.0.1-SNAPSHOT.jar"]
