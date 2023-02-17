FROM tomcat:8
COPY target/dockeransible-v1.0.1.war /usr/local/tomcat/webapps/web-app.war
#CMD ["catalina.sh", "run"]
EXPOSE '8080'