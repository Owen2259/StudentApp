FROM maven 3.9.6-eclipse-temurin-17 AS build
COPY . .

RUN cd student-management/student-management && mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine

COPY --from=build /app/student-management/student-management/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["Java", "-jar", "app.jar"]
