# ---------- Stage 1: Build the application ----------
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# Set working directory inside the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Package the application (clean + build)
RUN mvn clean package -DskipTests

# ---------- Stage 2: Run the application ----------
FROM openjdk:17-jdk-slim

# Set working directory inside the final image
WORKDIR /app

# Copy the built JAR from the previous stage
COPY --from=builder /app/target/my-java-app-1.0-SNAPSHOT.jar app.jar

# Expose port (optional, if it's a web app)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
