pipeline {

        environment {
        
        DOCKERHUB_USERNAME = 'mirzazam'
        DOCKER_IMAGE_NAME = 'jenkins'
        DOCKER_IMAGE_TAG = 'latest'
        DOCKER_TOKEN = credentials('dockertoken')
        NEXUS_CREDS = credentials('nexus')
        NEXUS_IP = '18.224.179.108'
        NEXUS_PORT = '8081'
        NEXUS_USER = 'admin'
        NEXUS_PORT_HTTP = '9000'
        REGISTERY = 'http://3.141.11.80:8085'
        IP_WITHPORT = '3.141.11.80:8085'
        registry = '3.141.11.80:8085'
        registryCredentials = 'nexus'
        
        
    }

    agent any
    stages {
        stage('Build the docker image') {
            steps {
                
                    sh 'docker build -t ${IP_WITHPORT}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} . '
                
            }
        }

        stage('Push the docker image to nexus repo') {
            steps {
                script {
                    docker.withRegistry( 'http://'+registry, registryCredentials) {
                        dockerImage.push()
                    }
                }
                    
                    }
                
            
        }

        
    }
}




