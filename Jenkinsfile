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
     withCredentials([file(credentialsId: 'cred', variable: 'MY_FILE')]){
        sh 'TF_VAR_cred=$MY_FILE terraform apply --auto-approve'
        }
    }
    }
  
    stage('terraform destroy') {
    steps {
        withCredentials([file(credentialsId: 'cred', variable: 'MY_FILE')]){
        sh 'TF_VAR_cred=$MY_FILE terraform destroy --auto-approve'
        }
    }
    }
 }
}

