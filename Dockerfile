FROM tomcat:8
COPY target/.war /usr/local/tomcat/webapps/web-app.war
EXPOSE '8080'