pipeline{
    agent{label 'vinod'}
    stages{
        stage('code'){
            steps{
              git url: "https://github.com/Raman-2025/node-todo-cicd.git", branch: "master"
              echo "successful"
            }
        }
        stage('build'){
            steps{
                sh "docker build -t node-app:latest ."
                echo "successful"
            }
        }
        stage('push to dockerhub'){
            steps{
                withCredentials([usernamePassword 
                (credentialsId: "dockerHubCred",
                passwordVariable: "dockerHubPass",
                usernameVariable: "dockerHubUser") ]) {
                sh '''
                echo $dockerHubPass | docker login -u $dockerHubUser --password-stdin
                docker image tag node-app:latest $dockerHubUser/node-app:latest
                docker push $dockerHubUser/node-app:latest 
                '''
                }
            }
        }
        stage('deploy'){
            steps{
                sh "docker compose down && docker compose up -d --build"
                echo "successful"
            }
        }        
    }
}
