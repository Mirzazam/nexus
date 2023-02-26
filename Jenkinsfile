pipeline {

        environment {
        
        DOCKERHUB_USERNAME = 'mirzazam'
        DOCKER_IMAGE_NAME = 'jenkins'
        DOCKER_IMAGE_TAG = 'latest'
        DOCKER_TOKEN = credentials('dockertoken')
        NEXUS_CREDS = credentials('nexuscreds')
        NEXUS_IP = '18.188.93.114'
        NEXUS_PORT = '8081'
        NEXUS_USER = 'admin'
        NEXUS_PORT_HTTP = '9000'
        REGISTERY = 'http://18.188.93.114:8085'
        
    }

    agent any
    stages {
        stage('Build the docker image') {
            steps {
                
                    sh 'docker build -t ${DOCKERHUB_USERNAME}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} .'
                
            }
        }

        stage('Push the docker image to nexus repo') {
            steps {
                    script{
                        docker.withRegistry("${REGISTERY}", "${NEXUS_CREDS}" ) {
                            dockerImage.push('latest')
                        }
                    }
                    }
                
            
        }

        
    }
}




