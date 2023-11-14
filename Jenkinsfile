pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/igornevertired/DevProject.git']])
            }
        }
        
        stage('Docker') {
            steps {
                script {
                    def imageName = "my-nginx-image"
                    def containerName = "my-nginx-container"
                    sh "docker build -t $imageName ."
                    
                    sh "docker stop $containerName  true"
                    sh "docker rm $containerName  true"
                    
                    sh "docker run -d -p 80:80 -p 443:443 --name $containerName $imageName"
                }
            }
        }
    }
}