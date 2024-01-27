pipeline {
    agent any

    stages {

        stage('Snyk Scan') {
            steps {
                echo 'Testing'
                snykSecurity(
                    snykInstallation: 'snyk@latest',
                    snykTokenId: 'snyk-api-toke',
                    failOnIssues: false,
                    monitorProjectOnBuild: true,
                    additionalArguments: '--all-projects --d'
                )
            }
        }
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
