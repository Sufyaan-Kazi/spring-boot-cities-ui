FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD cities-ui-1.0.jar app.jar
RUN sh -c 'touch /app.jar'
EXPOSE 80
ENTRYPOINT [ "java", "-jar", "/app.jar" ]
