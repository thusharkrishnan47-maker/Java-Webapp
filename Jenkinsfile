pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "thusharbkrishnan7/java-maven-app"
        DOCKER_TAG   = "${BUILD_NUMBER}"
    }

    stages {

        stage('Build Java App') {
            steps {
                echo "Building Java application"
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image"
                sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
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
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
                    '''
                }
            }
        }

        stage('Deploy to K3s using Ansible') {
            steps {
                echo "Deploying application to K3s via Ansible"
                sh """
                    ansible-playbook ansible/deploy-k3s.yml \
                      -i ansible/inventory.ini \
                      --extra-vars "docker_image=${DOCKER_IMAGE} docker_tag=${DOCKER_TAG}"
                """
            }
        }
    }

    post {
        success {
            echo "✅ CI/CD Pipeline completed successfully!"
        }
        failure {
            echo "❌ CI/CD Pipeline failed. Check Jenkins logs."
        }
    }
}
