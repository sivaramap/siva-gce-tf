pipeline {
    agent any
    tools {
        Terraform 'Terraform v0.12.20'
    }
    environment {
    //TF_WORKSPACE = 'dev' //Sets the Terraform Workspace
    TF_IN_AUTOMATION = 'true'
    }
     
    stages {
        stage ('checkout'){
            steps {
                git branch: 'master', url: 'https://github.com/sivaramap/gce-vm-tf.git'
            }
        }
      
		stage('Set Terraform path') {
            steps {
                script {
                    def tfHome = tool name: 'Terraform'
                    env.PATH = "${tfHome}:${env.PATH}"
                }
                sh 'terraform --version'
          }
        }
        
         stage('Provision infrastructure') {
            steps {
                dir("terraform-gce") 
                {
                sh 'terraform init'
                sh 'terraform plan'
                sh 'terraform apply -auto-approve'
             }
        }
        }
       
    }
}
