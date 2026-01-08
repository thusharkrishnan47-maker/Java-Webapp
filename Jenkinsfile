pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "thusharbkrishnan7/java-maven-app"
        DOCKER_TAG   = "latest"
        K3S_NODE_IP  = "172.31.26.223"   // K3s EC2 private IP
    }

        stage('Build Java App') {
            steps {
                echo "Building Java application"
                sh '''
                  mvn clean package -DskipTests
                '''
            }
        
        stage('Build Docker Image') {
            steps {
                echo "Building Docker image"
                sh '''
                  docker build -t $DOCKER_IMAGE:$DOCKER_TAG .
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                echo "Pushing image to DockerHub"
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                      echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                      docker push $DOCKER_IMAGE:$DOCKER_TAG
                    '''
                }
            }
        }

        stage('Deploy to K3s') {
            steps {
                echo "Deploying application to K3s cluster"
                sshagent(['k3s-ssh']) {
                    sh """
                      ssh -o StrictHostKeyChecking=no ec2-user@$K3S_NODE_IP '
                        kubectl apply -f /home/ec2-user/k8s/deployment.yaml
                        kubectl apply -f /home/ec2-user/k8s/service.yaml
                        kubectl rollout status deployment/java-app
                      '
                    """
                }
            }
        }
    }

    post {
        success {
            echo "✅ CI-CD Pipeline completed successfully!"
        }
        failure {
            echo "❌ Pipeline failed. Check logs."
        }
    }
}
