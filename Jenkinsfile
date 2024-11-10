pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Check out the source code from the repository
                git 'https://github.com/iffat999/Lab3.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                // Run Maven clean and package commands to build the project
                script {
                    sh 'mvn clean package -DskipTests'
                }
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHubCredentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    // Docker login using stored credentials
                    sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                }
            }
        }

        stage('Docker Build') {
            steps {
                // Build Docker image with the tag 'lab3'
                sh 'docker build -t lab3 .'
            }
        }

        stage('Docker Push') {
            steps {
                // Push the Docker image to Docker Hub
                sh 'docker push lab3'
            }
        }
    }
}

