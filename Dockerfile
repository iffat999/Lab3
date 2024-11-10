# Use OpenJDK 11 slim image as the base image
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file into the container
COPY target/hello.jar /app/hello.jar

# Set the entry point to run the application
ENTRYPOINT ["java", "-jar", "/app/hello.jar"]

# Expose port 8080
EXPOSE 8080
