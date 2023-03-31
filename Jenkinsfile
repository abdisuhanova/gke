pipeline{

 agent any
 stages {
    stage('init') {
    steps {
        sh 'terraform init'
    }
    }
    stage('plan') {
    steps {
     withCredentials([file(credentialsId: 'cred', variable: 'MY_FILE')]){
        sh 'terraform plan '
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
