FROM maven:3.5-jdk-8-slim AS build
COPY . /src
WORKDIR /src
RUN mvn package

FROM saturnism/graal:1.0.0-rc2 AS graal
RUN apt-get update && apt-get -y install gcc zlib1g-dev
COPY --from=build /src/target/helloworld-server-1.0-SNAPSHOT.jar /app/helloworld-server.jar
WORKDIR /app
RUN native-image \ 
    --no-server \
    -H:+ReportUnsupportedElementsAtRuntime \
    --static \
    -jar helloworld-server.jar

FROM scratch
COPY --from=graal /app/helloworld-server /app
CMD ["/app"]
