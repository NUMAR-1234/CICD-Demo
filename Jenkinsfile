pipeline{
    agent any

    stages{
        stage('Build'){
            steps{
              sh 'pwd'
              sh 'docker build -t loginpageapplication:latest .'
            }
        }

        stage('Push the Docker Image'){
            steps{
                sh 'docker tag loginpageapplication umarmukthar/loginpageapplication'
                sh 'docker push umarmukthar/loginpageapplication'
            }
        }
    }
}