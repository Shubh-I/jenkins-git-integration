pipeline {
   agent any
    def mvnHome = tool name:'maven-3.6.3', type: 'maven'
   stages {
    stage('Checkout') {
      steps {
               checkout scm
       }
    }
    stage('build') {
       steps {   
          sh "${mvnHome}/bin/mvn package"
        }
    }
      stage('scan') {
        steps {
              withSonarQubeEnv(installationName: 'sonarqube') {
                 sh "${mvnHome}/bin/mvn clean sonar:sonar"
        }
    }
  }
  }
}
