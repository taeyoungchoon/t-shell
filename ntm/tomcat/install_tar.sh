wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.14/bin/apache-tomcat-9.0.14.tar.gz
tar xvfz apache-tomcat-9.0.14.tar.gz
mv apache-tomcat-9.0.14 /opt
cd /opt
ln -s apache-tomcat-9.0.14 tomcat
cd tomcat/bin
