FROM tomcat:8
COPY target/dockeransible-v1.0.0.war /usr/local/tomcat/webapps/webapp.war
CMD ["catalina.sh", "run"]
EXPOSE '8080'