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
        sh 'terraform plan '
        }
    }
    stage('terraform apply') {
    steps {
        input {
            message 'Are you sure to destroy all app'
            id 'envId'
            ok 'Submit'
            parameters {
                choice choices: ['no', 'yes', 'minnn', 'destroy'], name: 'proceed'
                }
            }
        }
    }
  
    stage('terraform destroy') {
    steps {
        sh 'terraform destroy -auto-approve '
    
    }
    }
 }
}
