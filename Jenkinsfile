pipeline {
    agent any

    environment {
        DOCKER_HOST = 'ssh://igornevertired@172.19.0.1/'
        IMAGE_NAME = 'my-nginx-image'
        CONTAINER_NAME = 'my-nginx-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage ('build docker image') {
            when {
            environment name: 'BUILD_IMAGE',
            value: 'true'
            beforeAgent true
        }

        stage('Deploy to Remote Server') {
            steps {
                script {
                    // Подключение к удаленному серверу по SSH
                    sshagent(credentials: ['239bce57-c9aa-4217-8346-e5fb8b0ba7c5']) 
                    
                }
            }
        }
    }
}