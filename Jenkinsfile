pipeline {
    agent any

    environment {
        DOCKER_USERNAME = credentials('Credential_ID') // Reference to the Docker credentials
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Maven Project') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Credential_ID', usernameVariable: 'iffat108', passwordVariable: 'Docker111!!!')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                }
            }
        }

         stage('Docker Build') {
            steps {
                // Build Docker image with the appropriate tag
                sh 'docker build -t iffat105/lab3:latest .' 
            }
        }

        stage('Docker Push') {
            steps {
                // Push the Docker image to your Docker Hub repository
                sh 'docker push iffat105/lab3:latest' 
        }
    }
}

