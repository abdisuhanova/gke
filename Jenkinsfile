pipeline{
    environment {
        PROJECT_ID = 'playground-s-11-e0cdb590'
        CLUSTER_NAME = '<<Your GKE Cluster Name>>'
        LOCATION = 'us-east-1'
        CREDENTIALS_ID = 'cred'
     }
 agent any
 stages {
    stage('init') {
    steps {
     withCredentials([file(credentialsId: 'cred', variable: 'MY_FILE')]){
        sh 'export GOOGLE_APPLICATION_CREDENTIALS=$MY_FILE && terraform init'
    }
    }
    }
    stage('plan') {
    steps {
     withCredentials([file(credentialsId: 'cred', variable: 'MY_FILE')]){
        sh 'export GOOGLE_APPLICATION_CREDENTIALS=$MY_FILE && terraform plan '
        }
    }
    }
    stage('terraform apply') {
    steps {
     withCredentials([file(credentialsId: 'cred', variable: 'MY_FILE')]){
        sh 'export GOOGLE_APPLICATION_CREDENTIALS=$MY_FILE && terraform apply --auto-approve'
        }
    }
    }
  
    stage('terraform destroy') {
    steps {
        withCredentials([file(credentialsId: 'cred', variable: 'MY_FILE')]){
        sh 'export GOOGLE_APPLICATION_CREDENTIALS=$MY_FILE && terraform destroy --auto-approve'
        }
    }
    }
 }
}

