pipeline {
  agent any
    stages {
        stage('Checkout') {

            environment {
                GIT_COMMIT = sh(script: "git rev-parse HEAD | cut -c 1-3", returnStdout: true).trim()
                BRANCH_NAME = sh(script: 'git rev-parse --abbrev-ref HEAD', returnStdout: true).trim()
            }

            steps {
                echo "Commit ID: ${env.GIT_COMMIT}"
                echo "Branch Name: ${env.BRANCH_NAME}"
            }

        }


        stage('Build') {

            steps {
                sh "sed -i 's/Branch_name/${BRANCH_NAME}/' kaniko.yml "
                sh "sed -i 's/Container_name/${BRANCH_NAME}/' kaniko.yml "
                sh "sed -i 's/vlatest/${GIT_COMMIT}/' kaniko.yml "
                sh "kubectl apply -f kaniko.yml"
            } 
        }

        stage('CD') {
            steps {
                sh "sed -i 's/latest/${GIT_COMMIT}/' deploy.yaml"
                sh "kubectl apply -f deploy.yaml"
                sh "kubectl apply -f conf.yaml"
            }
        }
    }
}
