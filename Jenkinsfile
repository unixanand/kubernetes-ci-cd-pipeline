pipeline {
    agent any

    environment {
        IMAGE_NAME = "08474/kubernetes-app"
        TAG = "${BUILD_NUMBER}"
        DOCKER_CREDS = "dockerhub-creds"
    }

    stages {

        stage('Prepare Workspace') {
            steps {
                sh 'mkdir -p /opt/devops-project'
            }
        }

        stage('Clone Repo') {
            steps {
                dir('/opt/devops-project') {
                    git branch: 'main', url: 'https://github.com/unixanand/kubernetes-ci-cd-pipeline.git'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                dir('/opt/devops-project') {
                    sh 'docker build -t $IMAGE_NAME:$TAG .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                dir('/opt/devops-project') {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                        sh '''
                          echo $PASS | docker login -u $USER --password-stdin
                          docker push $IMAGE_NAME:$TAG
                          docker logout
                        '''
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                dir('/opt/devops-project') {
                    sh '''
                      kubectl apply -f streamlit-deployment.yaml
                      kubectl set image deployment/streamlit-app streamlit=$IMAGE_NAME:$TAG
                      kubectl rollout status deployment/streamlit-app
                    '''
                }
            }
        }
    }
}
