pipeline {
    agent any

    environment {
        DOCKER_USERNAME = credentials('Credential_iD') // Fetch Docker Hub username from Jenkins credentials
        DOCKER_PASSWORD = credentials('Credential_iD') // Fetch Docker Hub password from Jenkins credentials
    }

    tools {
        // Ensuring Maven 3 is used by Jenkins
        maven 'Maven 3' // Replace with the actual name of the Maven tool configured in Jenkins if it's different
    }

    stages {
        // a. Checkout stage
        stage('Checkout') {
            steps {
                // Checkout the code from the GitHub repository
                checkout scm
            }
        }

        // b. Build Maven project stage
        stage('Build Maven Project') {
            steps {
                // Clean and build the Maven project using Maven3
                sh 'mvn clean package'
            }
        }

        // d. Docker login stage
        stage('Docker Login') {
            steps {
                // Docker login using credentials stored in Jenkins
                withCredentials([usernamePassword(credentialsId: 'Credential_iD', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    // Use the credentials to log into Docker Hub
                    sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                }
            }
        }

        // e. Docker build stage
        stage('Docker Build') {
            steps {
                // Build Docker image and tag it as 'iffat105/lab3:latest'
                sh 'docker build -t iffat105/lab3:latest .'  // Replace 'lab3' with your actual Docker image name if needed
            }
        }

        // f. Docker push stage
        stage('Docker Push') {
            steps {
                // Push the Docker image to Docker Hub
                sh 'docker push iffat105/lab3:latest'  // Replace 'lab3' with your actual Docker image name if needed
            }
        }
    } // End of stages block
} // End of pipeline block
