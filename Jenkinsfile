pipeline {
    agent any

    options {
        timestamps()
        disableConcurrentBuilds()
        skipDefaultCheckout(true)
    }

    environment {
        IMAGE_REPOSITORY = 'hyejins/isec6000-assessment2-app'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            agent {
                docker {
                    image 'node:16-bullseye'
                    reuseNode true
                }
            }
            steps {
                sh 'node --version'
                sh 'npm ci'
            }
        }

        stage('Unit Tests') {
            agent {
                docker {
                    image 'node:16-bullseye'
                    reuseNode true
                }
            }
            steps {
                sh 'npm test'
            }
        }

        stage('Dependency Vulnerability Scan') {
            agent {
                docker {
                    image 'node:16-bullseye'
                    reuseNode true
                }
            }
            steps {
                sh 'npm audit --audit-level=high'
            }
        }

        stage('Build Application Image') {
            steps {
                sh 'docker build --pull -t "$IMAGE_REPOSITORY:$BUILD_NUMBER" -t "$IMAGE_REPOSITORY:latest" .'
            }
        }

        stage('Push Application Image') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-credentials',
                        usernameVariable: 'DOCKERHUB_USERNAME',
                        passwordVariable: 'DOCKERHUB_TOKEN'
                    )
                ]) {
                    sh '''
                        set +x
                        echo "$DOCKERHUB_TOKEN" | docker login --username "$DOCKERHUB_USERNAME" --password-stdin
                        docker push "$IMAGE_REPOSITORY:$BUILD_NUMBER"
                        docker push "$IMAGE_REPOSITORY:latest"
                        docker logout
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully: image built and published.'
        }
        failure {
            echo 'Pipeline failed: image publication was stopped.'
        }
    }
}
