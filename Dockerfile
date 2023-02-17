FROM tomcat:8
COPY target/*.war /usr/local/tomcat/webapps/web-app.war
#CMD ["catalina.sh", "run"]
EXPOSE '8080'