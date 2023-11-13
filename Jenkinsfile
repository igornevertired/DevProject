pipeline {
    agent any
    
    environment {
        IMAGE_NAME = 'my-nginx-image'
        CONTAINER_NAME = 'my-nginx-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Run Docker Container') {
            steps {
                script {
                    // Сначала остановим и удалим предыдущий контейнер
                    sh "docker stop $CONTAINER_NAME  true"
                    sh "docker rm $CONTAINER_NAME  true"
                    
                    // Затем соберем и запустим новый контейнер
                    sh "docker build -t $IMAGE_NAME ."
                    sh "docker run -d -p 80:80 -p 443:443 --name $CONTAINER_NAME $IMAGE_NAME"
                }
            }
        }
    }
}