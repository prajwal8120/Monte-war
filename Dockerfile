FROM tomcat:9
COPY target/*.war /usr/local/tomcat/webapps/regapp.war
CMD ["catalina.sh", "run"]
EXPOSE '8080'