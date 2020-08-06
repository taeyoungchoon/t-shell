tar xvfz OpenJDK8U-jdk_x64_linux_8u232b09.tar.gz 
sudo mv openjdk-8u232-b09 /usr/lib/jvm/
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/openjdk-8u232-b09/bin/java 1
#sudo update-alternatives --config java
sudo update-alternatives --set java /usr/lib/jvm/openjdk-8u232-b09/bi/java 1
java -version

