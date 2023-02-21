FROM tomcat:8
COPY target/*.war /usr/local/tomcat/webapps/webappv1.0.10.war
#CMD ["catalina.sh", "run"]
EXPOSE '8080'