pipeline{

 agent any
 stages {
    stage('init') {
    steps {
     withCredentials([file(credentialsId: 'cred', variable: 'MY_FILE')]){
        sh 'TF_VAR_cred=$MY_FILE terraform init'
    }
    }
    }
    stage('plan') {
    steps {
     withCredentials([file(credentialsId: 'cred', variable: 'MY_FILE')]){
        sh 'TF_VAR_cred=$MY_FILE terraform plan '
        }
    }
    }
    stage('terraform apply') {
    steps {
        sh 'terraform apply'
        }
    }
  
    stage('terraform destroy') {
    steps {
        sh 'terraform destroy -auto-approve '
    
    }
    }
 }
}

