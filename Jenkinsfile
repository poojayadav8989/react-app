pipeline {
    agent any

    environment {
        DOCKER_CRED = credentials('docker-cred')
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/poojayadav8989/react-app.git'
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
                sh '''
                    docker login -u $DOCKER_CRED_USR -p $DOCKER_CRED_PSW
                    ./deploy.sh
                '''
            }
        }
    }
}

