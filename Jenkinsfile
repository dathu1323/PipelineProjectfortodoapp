pipeline {
    agent any
    
    environment {
        // Customize the image name and tag as per your Docker registry setup
        DOCKER_HUB_CREDENTIALS = 'docker'
        DOCKER_IMAGE_NAME = 'dathu1323/pipelinetesttodoapp'
        DOCKER_IMAGE_TAG = 'latest'
    }
    
    stages {
        stage('Pull from Git') {
            steps {
                // Checkout the Git repository using credentials
                git credentialsId: 'git', url: 'https://github.com/dathu1323/PipelineProjectfortodoapp.git'
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                // Go to the 'todoapp' directory
                dir('todoapp') {
                    // Install the Node.js dependencies
                    sh 'npm install'
                    
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ."

                    // Log in to your Docker registry (e.g., Docker Hub)
                    sh "docker login -u your-docker-username -p your-docker-password"

                    // Push the Docker image to your Docker registry
                    sh "docker push ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                }
            }
        }
    }
}
