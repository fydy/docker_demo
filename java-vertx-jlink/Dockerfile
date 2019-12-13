FROM alpine:3.8 as jdk
RUN mkdir /opt && wget -qO- https://download.java.net/java/early_access/alpine/27/binaries/openjdk-11+27_linux-x64-musl_bin.tar.gz | tar xz -C /opt
RUN /opt/jdk-11/bin/jlink \
    --module-path /opt/jdk-11/jmods \
    --verbose \
    --add-modules java.base,java.logging \
    --compress 2 \
    --no-header-files \
    --output /opt/jdk-11-minimal

FROM maven:3-jdk-11-slim as build
COPY pom.xml /usr/src/vertx/pom.xml
RUN mvn -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn --batch-mode --file /usr/src/vertx/pom.xml --quiet dependency:go-offline
COPY src /usr/src/vertx/src
RUN mvn --batch-mode --file /usr/src/vertx/pom.xml clean package

FROM alpine:3.8
COPY --from=jdk /opt/jdk-11-minimal /opt/jdk-11-minimal
COPY --from=build /usr/src/vertx/target/lib /opt/vertx/lib
COPY --from=build /usr/src/vertx/target/*.jar /opt/vertx
EXPOSE 8080/tcp
ENTRYPOINT ["/opt/jdk-11-minimal/bin/java", "-Dio.netty.noUnsafe=true", "--illegal-access=warn", "-jar", "/opt/vertx/java-vertx-jlink-1.0-SNAPSHOT.jar"]
