FROM tomcat:9.0-jdk11-temurin
COPY target/java-webapp.war /usr/local/tomcat/webapps/
