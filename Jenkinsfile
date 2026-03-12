pipeline{
    agent any
    stages{
        stage("build docker images"){
            steps{
            bat 'docker build --no-cache -t vite-app . '
            
            }
        
        }

        stage('Deploy Container'){
            steps{
                bat '''
                docker stop vite-container || echo Container not running
                docker rm vite-container || echo Container not found
                docker rub -d -p 8081:00 --name vite-container vite-app
                '''
            }
        }
    }
}
