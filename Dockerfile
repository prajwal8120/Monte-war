FROM tomcat:8
COPY target/*.war /usr/local/tomcat/webapps/regapp.war
CMD ["catalina.sh", "run"]
EXPOSE 8080