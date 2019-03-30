cd /home/builder/build/landing/; 
git reset --hard;
git pull;
mvn install;
cp target/ROOT.war /opt/tomcat/cars64_webapps/;
