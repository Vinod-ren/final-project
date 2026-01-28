FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
COPY ./webapp/target/webapp-24.09.01.war /usr/local/tomcat/webapps
