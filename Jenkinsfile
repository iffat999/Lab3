pipeline {
    agent any

    environment {
        DOCKER_USERNAME = credentials('Credential_id') // Using the correct Docker Hub credentials ID 'Credential_id'
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
                // Clean and build the Maven project
                sh 'mvn clean package'
            }
        }

        // c. Add your Docker Hub’s password to Jenkins Credentials
        // This part is already done by creating the 'Credential_id' in Jenkins with the username and password.
        // The 'Credential_id' will be used in the Docker login stage.

        // d. Docker login stage
        stage('Docker Login') {
            steps {
                // Docker login using credentials stored in Jenkins
                withCredentials([usernamePassword(credentialsId: 'Credential_id', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
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
    }
}

