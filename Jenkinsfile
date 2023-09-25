pipeline {
    agent any

    environment {
        TF_VERSION = '0.15.0' // Specify the Terraform version
    }

    stages {
        stage('Checkout and Scan with Checkov') {
    steps {
        script {
            // Clone the Git repository
            checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/chndel-abhishek/Checkov.git']]])

            // Remove existing Terraform binary (if present)
            sh "rm -f terraform"

            // Install Terraform
            sh "curl -LO https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip"
            sh "unzip terraform_${TF_VERSION}_linux_amd64.zip"
            sh "chmod +x terraform"

            // Install Checkov
            sh "pip install checkov"

            // Run Terraform commands
            sh "./terraform init"
            sh "./terraform plan"
            sh "./terraform apply -auto-approve"

            // Run Checkov
            sh "checkov -d ."
        }
    }
}

    }

    post {
        success {
            echo "Checkov scan completed successfully."
        }

        failure {
            echo "Checkov scan failed."
        }
    }
}

