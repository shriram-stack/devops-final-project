pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-cred')
        DOCKER_USERNAME       = 'shriram123'
    }
    stages {
        stage('Build & Push Docker Image') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh './build.sh dev'
                    } else if (env.BRANCH_NAME == 'main') {
                        sh './build.sh prod'
                    } else {
                        echo "Nothing to do for branch: ${env.BRANCH_NAME}"
                    }
                }
            }
        }
    }
}
