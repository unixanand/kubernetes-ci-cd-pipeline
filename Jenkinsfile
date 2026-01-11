pipeline {
    agent any

    environment {
        IMAGE_NAME = "08474/kubernetes-app"
        TAG = "latest"
        DOCKER_CREDS = "dockerhub-creds"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/unixanand/kubernetes-ci-cd-pipeline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$TAG .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh '''
                      echo $PASS | docker login -u $USER --password-stdin
                      docker push $IMAGE_NAME:$TAG
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                  kubectl set image deployment/streamlit-app streamlit=$IMAGE_NAME:$TAG
                  kubectl rollout status deployment/streamlit-app
                '''
            }
        }
    }
}
