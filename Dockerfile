FROM maven as build
WORKDIR /opt/demo
COPY  . /opt/demo
RUN mvn package

FROM tomcat
WORKDIR /usr/local/tomcat
COPY --from=0 /opt/demo/target/sysfoo.war webapps/
CMD catalina.sh run
