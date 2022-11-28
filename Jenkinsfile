pipeline {
   agent any
   tools {
    def mvnHome = tool name:'maven-3.6.3', type: 'maven'
  }
   stages {
    stage('Checkout') {
      steps {
               checkout scm
       }
    }
    stage('build') {
       steps {   
                sh "/bin/mvn package"
        }
    }
      stage('scan') {
        steps {
              withSonarQubeEnv(installationName: 'sonarqube') {
                 sh "/bin/mvn clean sonar:sonar"
        }
    }
  }
  }
}
