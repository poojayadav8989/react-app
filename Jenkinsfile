pipeline {
    agent any
    environment {
        // Make sure Node, npm, and Docker are available
        PATH = "/opt/homebrew/bin:/usr/local/bin:${env.PATH}"
    }
    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/poojayadav8989/react-app.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }

        stage('Push & Deploy') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PSW')]) {
                    sh 'docker login -u $DOCKER_USER -p $DOCKER_PSW'
                    sh 'docker push poojayadav253/react-app:latest'
                }
            }
        }
    }
    post {
        failure {
            echo "Pipeline failed! Check logs for errors."
        }
        success {
            echo "Pipeline completed successfully"
        }
    }
}

