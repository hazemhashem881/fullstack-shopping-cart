pipeline {
  agent any
    stages {
        stage('build') {
            steps {
                sh "sed -i 's/latest/${BUILD_NUMBER}/' kaniko.yml "
                sh "kubectl apply -f kaniko.yml"
            } 
        }

        stage('CD') {
            steps {
                sh "kubectl apply -f namespace.yml"
                sh "sed -i 's/latest/${BUILD_NUMBER}/' appdeploy.yml "
                sh "kubectl apply -f . "
            }
        }
    }
}
