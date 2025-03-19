FROM openjdk:17-jdk-alpine AS builder
WORKDIR /app
COPY . .  
RUN ./mvnw package -DskipTests  

FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080
CMD [ "java", "-jar", "app.jar" ]