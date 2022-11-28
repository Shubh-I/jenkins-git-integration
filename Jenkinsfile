pipeline {
   agent any
    tools {
        maven 'maven-3.6.3'
    }
   // def mvnHome = tool:'maven-3.6.3', type: 'maven'
   stages {
    stage('Checkout') {
      steps {
               checkout scm
       }
    }
    stage('build') {
       steps {   
          sh "mvn package"
        }
    }
      stage('scan') {
        steps {
              withSonarQubeEnv(installationName: 'sonarqube') {
                 sh "mvn sonar:sonar -Dsonar.login=myAuthenticationToken"
        }
    }
  }
  }
}
