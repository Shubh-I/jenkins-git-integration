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
<<<<<<< HEAD
     stage('qualitygate check') {
        steps {
                 sh "waitForQualityGate abortPipeline: false, credentialsId: 'jenkins-sonar'"
        }
    }
  }
  }
}
=======
  }
}
>>>>>>> 82ed1ccdfffc84f35750a2476d2d41f31c991bd9
