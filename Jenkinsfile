pipeline {

        environment {
        
        DOCKERHUB_USERNAME = 'mirzazam'
        DOCKER_IMAGE_NAME = 'jenkins'
        DOCKER_IMAGE_TAG = 'latest'
        DOCKER_TOKEN = credentials('dockertoken')
        NEXUS_USER = 'admin'
        REGISTERY = 'http://3.141.11.80:8085'
        IP_WITHPORT = '3.141.11.80:8085'
        registryCredentials = 'nexus'
        
    }

    agent any
    stages {
        stage('Build the docker image') {
            steps {
                
            sh 'docker build -t ${IP_WITHPORT}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} . '
                }
        }

        stage('login to docker hosted repo') {
            steps {
                script {
                    docker.withRegistry( REGISTERY, registryCredentials) {
                    }
                }
                    
                    } 
        }

        stage('push the image to nexus repo'){
            steps{
                sh 'docker push ${IP_WITHPORT}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}'
            }
        }
    }

    post {
        always{
            script{
                sh 'docker logout'
            }
        }
    }
}




