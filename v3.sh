cp src/main/resources/templates/index2.html src/main/resources/templates/index.html
./unsneaky.sh
./deploy.sh
sleep 15
./test.sh
