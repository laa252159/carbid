cd /home/builder/build/perekup_test/;
git reset --hard;
git pull;
mvn install;
cp target/ROOT.war /opt/tomcat/sanix_webapps/;
