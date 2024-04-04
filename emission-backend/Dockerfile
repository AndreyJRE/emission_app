FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu as runtime-build

# Create a custom Java runtime
RUN $JAVA_HOME/bin/jlink \
         --add-modules java.base \
         --strip-debug \
         --no-man-pages \
         --no-header-files \
         --compress=2 \
         --output /javaruntime

# Define your base image. You may use any base OS and version of your choice.
FROM debian:buster-slim
ENV LANG en_US.UTF-8
ENV JAVA_HOME /usr/lib/jvm/msopenjdk-17-amd64
ENV PATH "${JAVA_HOME}/bin:${PATH}"
COPY --from=runtime-build /javaruntime $JAVA_HOME

FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu

WORKDIR /app
COPY . /app

RUN ./mvnw  -B -DskipTests clean package

EXPOSE 8080

CMD ["java", "-jar", "target/emission-backend-0.0.1-SNAPSHOT.jar"]