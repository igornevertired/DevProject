pipeline {
    agent any
    
    environment {
        IMAGE_NAME = 'my-nginx-image'
        CONTAINER_NAME = 'my-nginx-container'
    }
    stages {
        stage('Print Environment') {
            steps {
                script {
                    sh 'echo $PATH'
                    sh 'docker --version'
                }
            }
        }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/igornevertired/DevProject']]])
            }
        }

        stage('Build and Run Docker Container') {
            steps {
                script {
                    // Выведем содержимое каталога для диагностики
                    sh "ls -la"

                    // Сначала остановим и удалим предыдущий контейнер
                    sh "docker stop $CONTAINER_NAME  || true"
                    sh "docker rm $CONTAINER_NAME || true"
                    
                    // Затем соберем и запустим новый контейнер
                    sh "docker build -t $IMAGE_NAME ."
                    sh "docker run -d -p 80:80 -p 443:443 --name $CONTAINER_NAME $IMAGE_NAME"
                    }
                }
            }
        }
    }
}