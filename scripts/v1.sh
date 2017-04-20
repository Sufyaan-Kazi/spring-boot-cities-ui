cp src/main/resources/templates/index1.html src/main/resources/templates/index.html
cp src/main/java/io/pivotal/fe/demos/citiesui/repository/CityRepository1.txt src/main/java/io/pivotal/fe/demos/citiesui/repository/CityRepository.java
./deploy.sh
sleep 15
./test.sh&
