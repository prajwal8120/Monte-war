FROM tomcat:8
COPY target/*.war /usr/local/tomcat/webapps/regapp.war
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
EXPOSE '8080'