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
                 sh "mvn sonar:sonar -Dsonar.login=squ_04835ba089c40b3237f085134ac46e3583333e7b"
        }
    }
  }
     stage('qualitygate check') {
        steps {
                script{
                  def qualitygate = waitForQualityGate()
                    if (qualitygate.status != "OK") {
                   error "Pipeline aborted due to quality gate coverage failure: ${qualitygate.status}"
                    }
        }
    }
  }
    stage ('upload to nexus'){
      steps {
          script{
            nexusArtifactUploader artifacts:
             [
              [artifactId: 'junit', 
              classifier: '', 
              file: 'target/jenkins-git-integration.war', 
              type: 'war'
              ]
              ], 
              credentialsId: 'nexus-auth', 
              groupId: 'junit', 
              nexusUrl: '3.235.67.31:8081', 
              nexusVersion: 'nexus3', 
              protocol: 'http', 
              repository: 'jenkins-java-app', 
              version: '3.8.1'
          }
      }
    }
    
    }
  }
  

//lets test