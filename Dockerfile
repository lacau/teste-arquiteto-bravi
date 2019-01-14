FROM openjdk:10.0.1-10-jre
ARG artifactVersion

ENV workdir /opt/teste-arquiteto-bravi

WORKDIR $workdir
COPY target/teste-arquiteto-bravi-${artifactVersion}.jar $workdir/teste-arquiteto-bravi.jar
COPY target/classes/application.properties $workdir/config/application.properties

EXPOSE 8090

ENTRYPOINT java $JAVA_OPTS --add-modules java.se.ee -jar teste-arquiteto-bravi.jar
