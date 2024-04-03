
FROM maven:3-openjdk-17-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean install -DskipTests

FROM openjdk:17-jdk-slim
COPY --from=build /home/app/target/emission-*.jar emission_backend.jar
ENTRYPOINT ["java","-jar","/emission_backend.jar"]
EXPOSE 8080
