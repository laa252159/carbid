cd /home/builder/build/perekup_prod/;
git reset --hard;
git pull;
mvn install;
cp target/ROOT.war /opt/tomcat/perekup_webapps/;