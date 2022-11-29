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
    stage('docker build') {
        steps {
                script{
                  $tag= VersionNumber(versionNumberString: '${BUILD_DATE_FORMATTED, "yyyyMMdd"}-develop-${BUILDS_TODAY}')
                  docker build -t project/jenkins-integration:$tag .
                }
                 

        }
    }
  }
  }
}
//lets test