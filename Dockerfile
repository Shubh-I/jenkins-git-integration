FROM 18.0.2.1-jdk-oraclelinux8
COPY target/jenkins-git-integration.war /jenkins-git-integration.war
CMD ["java" "-war", "jenkins-git-integration.war"]
