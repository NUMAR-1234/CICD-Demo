pipeline{
    agent any

    stages{
        stage('Build'){
            steps{
              sh 'pwd'
              sh 'rm -rf CICD-Demo '
              sh 'git clone https://github.com/NUMAR-1234/CICD-Demo.git'
              sh 'cd CICD-Demo'
              sh 'docker build -t loginpageapplication:${BUILD_NUMBER} .'
            }
        }
        stage('Push the Docker Image'){
            steps{
                sh 'docker tag loginpageapplication:${BUILD_NUMBER} umarmukthar/loginpageapplication:${BUILD_NUMBER}'
                sh 'docker push umarmukthar/loginpageapplication:${BUILD_NUMBER}'
            }
        }
        stage('Run the application'){
            steps{
                sh 'kubectl apply -f deployment.yaml'
                sh 'minikube service sampleloginapplication-service'
            }
        }
    }
}
