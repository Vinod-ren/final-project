pipeline {
    agent any
    environment {
        DOCKER_IMAGE    = "vikasmanda/final-project-app"
        DOCKER_TAG      = "${BUILD_NUMBER}"
    }

    stages { 
        stage('code checkout') {
            steps {
                git branch: 'vinod_feature', url: 'https://github.com/Vinod-ren/final-project.git'
            }
        }
        stage('maven build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('code coverage') {
            steps {
                sh 'mvn site'
            }
        }
        stage('docker build'){
            steps{
                sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest"
            }
        }
    }
}
