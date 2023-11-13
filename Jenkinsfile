pipeline{
    agent any
    stages{
        stage('Checkout'){
            steps{
                git 'https://github.com/igornevertired/DevProject'
            }
        }
        stage('Run Docker'){
            steps{
                script{
                    docker.build('my-nginx', '.')
                    docker.image('my-nginx').run('-p 80:80 -p 443:443 -d')
                }
            }
        }
    }
}