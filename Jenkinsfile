pipeline{
    environment {
        PROJECT_ID = 'pplayground-s-11-49fb42ee'
        CLUSTER_NAME = 'my-gke-cluster'
        LOCATION = 'us-central1'
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
    stage('deploy') {
    steps {
    withCredentials([file(credentialsId: 'cred', variable: 'MY_FILE')]){
      sh 'export GOOGLE_APPLICATION_CREDENTIALS=$MY_FILE && gcloud container clusters get-credentials $CLUSTER_NAME --region $LOCATION --project $PROJECT_ID'
    }
    }
 //   stage('terraform destroy') {
  //  steps {
   //     withCredentials([file(credentialsId: 'cred', variable: 'MY_FILE')]){
    //    sh 'export GOOGLE_APPLICATION_CREDENTIALS=$MY_FILE && terraform destroy --auto-approve'
     //   }
   // }
   // }
 }
}

