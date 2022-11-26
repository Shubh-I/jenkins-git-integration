pipeline {
   agent any
   tools {
    maven 'maven-3.6.3' 
  }
   stages {
    stage('Checkout') {
      steps {
               checkout scm
       }
    }
    stage('build') {
        steps {
              
                sh "mvn clean package"
        }
    }
      stage('scan') {
        steps {
              withSonarQubeEnv(installationName: 'sonarqube') {
                 sh "mvn clean sonar:sonar"
        }
    }
  }
  }
}
