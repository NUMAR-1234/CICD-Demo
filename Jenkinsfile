pipeline{
    agent any

    stages{
        stage('Build'){
            steps{
              sh 'pwd'
              sh 'docker build -t loginpageapplication:latest .'
            }
        }
    }
}