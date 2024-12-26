pipeline {
    agent any
    stages {
        stage('Setup') {
            steps {
                echo "Initializing Terraform"
                sh 'terraform init'
            }
        }
        stage('Plan') {
            steps {
                echo "Generating Terraform plan"
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Manual Approval') {
            steps {
                input message: "Approve the Terraform apply?", ok: "Proceed"
            }
        }
        stage('Apply') {
            steps {
                echo "Applying Terraform plan"
                sh 'terraform apply tfplan'
            }
        }
    }
    post {
        always {
            echo 'Pipeline execution completed.'
        }
    }
}
