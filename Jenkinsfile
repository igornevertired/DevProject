pipeline {
    agent any

    environment {
        DOCKER_HOST = 'ssh://igornevertired@192.168.1.69'
        IMAGE_NAME = 'my-nginx-image'
        CONTAINER_NAME = 'my-nginx-container'
    }
        stage('Deploy to Remote Server') {
            steps {
                script {
                    // Подключение к удаленному серверу по SSH
                    sshagent(credentials: ['239bce57-c9aa-4217-8346-e5fb8b0ba7c5']) {
                        sh "ssh $DOCKER_HOST 'docker stop $CONTAINER_NAME  true && docker rm $CONTAINER_NAME  true'"
                        sh "ssh $DOCKER_HOST 'docker run -d -p 80:80 -p 443:443 --name $CONTAINER_NAME $IMAGE_NAME'"
                    }
                }
            }
        }
    }