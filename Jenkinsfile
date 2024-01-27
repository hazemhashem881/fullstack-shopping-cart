pipeline {
    agent any

    stages {
        stage('Snyk CODE Scan') {
            steps {
                snykSecurity(
                    snykInstallation: 'snyk@latest',
                    snykTokenId: 'snyk-api-toke',
                    failOnIssues: false,
                    monitorProjectOnBuild: false,
                    additionalArguments: '--code -d'
                )
            }
        }
    }
}
