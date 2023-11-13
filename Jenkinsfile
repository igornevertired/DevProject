pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/DmitriyDovgolyonok/devOpsTrainee.git']])
            }
        }
        
        stage('Build and Run Docker Container') {
            steps {
                script {
                    def containerName = "my-nginx-container"
                    
                    sh "docker stop $containerName  true"
                    sh "docker rm $containerName  true"
                    sh "docker run -d -p 80:80 -p 443:443 --name $containerName"
                }
            }
        }
    }
}