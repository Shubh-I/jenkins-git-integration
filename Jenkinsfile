pipeline {
   agent any
   stages {
    stage('Checkout') {
      steps {
        script {
           // The below will clone your repo and will be checked out to master branch by default.
           git credentialsId: 'jenkins-user-github', url: 'https://github.com/Shubh-I/jenkins-git-integration.git'
         
          }
       }
    }
    stage('build') {
        steps {
              
                sh "${mavenCMD} clean package"
        }
    }
  }
}
