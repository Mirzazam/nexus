pipeline {

        environment {
        
        DOCKERHUB_USERNAME = 'mirzazam'
        DOCKER_IMAGE_NAME = 'jenkins'
        DOCKER_IMAGE_TAG = 'updated'
        REGISTERY = 'http://18.222.174.243:8085'
        IP_WITHPORT = '18.222.174.243:8085'
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
                        sh 'docker push "${IP_WITHPORT}"/"${DOCKER_IMAGE_NAME}":"${DOCKER_IMAGE_TAG}" '
                    }
                }
                    
                    } 
        }
        stage('logout from docker'){
            steps{
                sh 'docker logout'
            }
        }


    }
}




