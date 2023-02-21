FROM tomcat:9
COPY target/*.war /usr/local/tomcat/webapps/regapp.war
ENTRYPOINT ["catalina.sh", "run"]
EXPOSE 8080