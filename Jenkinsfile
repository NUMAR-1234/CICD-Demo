pipeline{
    agent any
        stages{
        stage('Checking git secrets using trufflehog'){
            steps{
               sh 'whoami'
               sh 'sudo systemctl start docker'
               sh 'sudo systemctl status docker'
               sh 'rm Gitsecrets || true'
               sh 'docker pull   gesellix/trufflehog'
               sh 'docker run -t gesellix/trufflehog  https://github.com/NUMAR-1234/CICD-Demo.git > Gitsecrets'
               sh 'cat Gitsecrets'
            }
        }
        stage('Dependency Check'){
            steps{
                sh 'pwd'
                sh 'npm install'
                sh 'ls -la'
                sh 'dependency-check/bin/dependency-check.sh --scan package.json --project "My OWASP Dependency Check Project" --format "HTML"  --out ./report'
            }
        }    
        stage('Build'){
            steps{
              sh 'docker build -t loginpageapplication:${BUILD_NUMBER} .'
            }
        }
        stage('Push the Docker Image'){
            steps{
                sh 'docker tag loginpageapplication:${BUILD_NUMBER} umarmukthar/loginpageapplication:${BUILD_NUMBER}'
                sh 'docker push umarmukthar/loginpageapplication:${BUILD_NUMBER}'
            }
        }
        
        stage('Scan the docker image'){
            steps{
              sh 'docker pull aquasec/trivy:0.18.3'
              sh 'docker run --rm -v //var/run/docker.sock:/var/run/docker.sock aquasec/trivy:0.18.3 --timeout 5m loginpageapplication:${BUILD_NUMBER}'
            }
        }
        

        stage('Update the kubernetes deployment file '){
            steps{
                 sh """
                 rm -rf argoCD
                 git clone https://github.com/NUMAR-1234/ArgoCD.git
                 cd argoCD
                 git switch master
                 cd sample-application
                 cat deployment.yaml
                 sed -i 's/loginpageapplication.*/loginpageapplication:${BUILD_NUMBER}/' deployment.yaml
                 cat deployment.yaml
                 git add deployment.yaml
                 git commit -m "updating the image tag as : ${BUILD_NUMBER}"
                 git push --set-upstream origin master """

            }
        }
    }
}

