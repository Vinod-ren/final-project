pipeline {
    agent any
    environment {
        DOCKER_IMAGE    = "vinod05061994/final_project"
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
           stage('Docker Push') {
            steps {
                // 'docker-hub-credentials' must be created in Jenkins Credentials
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', 
                                                 passwordVariable: 'DOCKER_PASS', 
                                                 usernameVariable: 'DOCKER_USER')]) {
                    sh "echo ${DOCKER_PASS} | docker login -u ${DOCKER_USER} --password-stdin"
                    sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    sh "docker push ${DOCKER_IMAGE}:latest"
                }
            }
        }
        stage('docker container') {
            steps{
                sh "docker run -d --name vinod$DOCKER_TAG -p 4000:8080 vinod05061994/final_project:$DOCKER_TAG"
            }
        }
    }
}
