pipeline{
    agent any

    stages{
        stage('Build'){
            steps{
              sh 'pwd'
              git 'https://github.com/NUMAR-1234/CICD-Demo.git'
              sh 'docker build -t loginpageapplication:${BUILD_NUMBER} .'
            }
        }

        stage('Push the Docker Image'){
            steps{
                sh 'docker tag loginpageapplication:${BUILD_NUMBER} umarmukthar/loginpageapplication:${BUILD_NUMBER}'
                sh 'docker push umarmukthar/loginpageapplication:${BUILD_NUMBER}'
            }
        }

        stage('clone and update the deployment file'){
            steps{
                sh 
            }
        }
    }
}