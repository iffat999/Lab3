# Use an official Maven image as the base image
FROM maven:3.8.4-openjdk-11-slim AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and source code into the container
COPY pom.xml .
COPY src ./src

# Run Maven to build the application
RUN mvn clean package

# Use a lightweight image to run the application
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the jar file from the builder stage
COPY --from=builder /app/target/hello.jar ./app.jar

# Command to run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
