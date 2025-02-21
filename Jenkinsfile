pipeline {
  agent any
  tools {
    jdk 'jdk17'
    nodejs 'node16'
  }
  environment {
    SCANNER_HOME = tool 'beniyesonarscanner'
    IMAGE_NAME = "beniye/node-hello-world"
    IMAGE_TAG = "latest"
    GIT_REPO = "https://github.com/beniye19/node-hello-world.git"
    CONTAINER_NAME = "amazon"
  }
  stages {
    stage('Load Env Files') {
      steps {
        script {
          // Load GitHub environment variables from github.env
          def githubEnv = readProperties file: 'github.env'
          // Load DockerHub environment variables from dockerhub.env
          def dockerhubEnv = readProperties file: 'dockerhub.env'
          
          // Add all variables from github.env to the environment
          githubEnv.each { key, value ->
            env[key] = value
          }
          // Add all variables from dockerhub.env to the environment
          dockerhubEnv.each { key, value ->
            env[key] = value
          }
          echo "Loaded GitHub and DockerHub environment variables."
        }
      }
    }
    stage('Checkout from Git') {
      steps {
        git branch: 'main', url: env.GIT_REPO
      }
    }
    stage('Install Dependencies') {
      steps {
        sh "npm install"
      }
    }
    stage('Unit Tests') {
      steps {
        // Run tests using Mocha with mocha-junit-reporter.
        // MOCHA_FILE instructs the reporter to write the output to test-results.xml.
        sh "MOCHA_FILE=./test-results.xml npm test"
        // Archive the test results so they can be viewed in Jenkins.
        junit 'test-results.xml'
      }
    }
    stage('SonarQube Analysis') {
      steps {
        withSonarQubeEnv('sonar-server') {
          sh '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Amazon \
          -Dsonar.projectKey=Amazon'''
        }
      }
    }
    stage('Quality Gate') {
      steps {
        script {
          def qualityGate = waitForQualityGate abortPipeline: false, credentialsId: 'Sonar-token'
          if (qualityGate.status != 'OK') {
            echo "WARNING: SonarQube Quality Gate did not pass. Status: ${qualityGate.status}"
          } else {
            echo "Quality Gate passed: ${qualityGate.status}"
          }
        }
      }
    }
    stage('TRIVY FS SCAN') {
      steps {
        sh "trivy fs . --severity HIGH,CRITICAL > trivyfs.json"
      }
    }
    stage('Docker Build & Push') {
      steps {
        script {
          // Using Jenkins' withDockerRegistry step.
          withDockerRegistry(credentialsId: 'docker', toolName: 'docker') {
            sh "docker build -t $IMAGE_NAME:$IMAGE_TAG ."
            sh "docker push $IMAGE_NAME:$IMAGE_TAG"
          }
        }
      }
    }
    stage('TRIVY') {
      steps {
        // This stage scans the built image; '|| true' ensures the pipeline continues even if vulnerabilities are detected.
        sh "trivy image --exit-code 1 --severity HIGH,CRITICAL $IMAGE_NAME:$IMAGE_TAG > trivy.json || true"
      }
    }
    stage('Remove container') {
      steps {
        sh "docker stop ${env.CONTAINER_NAME} || true"
        sh "docker rm ${env.CONTAINER_NAME} || true"
      }
    }
    stage('Deploy to container') {
      steps {
        sh "docker run -d --name ${env.CONTAINER_NAME} -p 3000:3000 $IMAGE_NAME:$IMAGE_TAG"
      }
    }
  }
}
