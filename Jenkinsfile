pipeline {
  agent any
    stages {
        stage('Checkout') {

            environment {
                GIT_COMMIT = sh(script: "git rev-parse HEAD | cut -c 1-3", returnStdout: true).trim()
            }

            steps {
                echo "Commit ID: ${env.GIT_COMMIT}"
            }

        }


        stage('Build') {

            steps {
                sh "sed -i 's/vlatest/${GIT_COMMIT}/' kaniko.yml "
                sh "kubectl apply -f kaniko.yml"
            } 
        }

        stage('CD') {
            steps {
                sh "sed -i 's/latest/${GIT_COMMIT}/' mong.yaml"
                sh "kubectl apply -f NS.yaml"
                sh "kubectl apply -f pvc.yaml"
                sh "kubectl apply -f conf.yaml"
                sh "kubectl apply -f mong.yaml"
            }
        }
    }
}
