pipeline {
  agent {
    node { label'front'}
  }
    stages {
        stage('Checkout') {

            environment {
                GIT_COMMIT = sh(script: "git rev-parse HEAD | cut -c 1-7", returnStdout: true).trim()
            }

            steps {
                echo "Commit ID: ${env.GIT_COMMIT}"
            }

        }


        stage('Build') {

            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                    sh "docker build . -t hazemhashem100/frontend:v${env.GIT_COMMIT}"
                    sh "docker push hazemhashem100/frontend:v${env.GIT_COMMIT}"
                }
                
            }
        }

        stage('CD') {
            steps {
                sh "sed -i 's/latest/${env.GIT_COMMIT}/' react.yml"
                
                sh "kubectl apply -f /opt/jenkins/workspace/mern-stack_frontend/NS.yaml"
                sh "kubectl apply -f /opt/jenkins/workspace/mern-stack_frontend/react.yml"
            }
        }
    }
}
