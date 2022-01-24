FROM openjdk:14-slim

ARG JAR_FILE_PATH=luckysheet/target/*.jar
COPY ${JAR_FILE_PATH} app.jar

ENTRYPOINT ["java", "-jar", "app.jar", "--spring.profiles.active=postgres"]
