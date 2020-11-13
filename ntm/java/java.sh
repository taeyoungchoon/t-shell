wget https://github.com/AdoptOpenJDK/openjdk8-upstream-binaries/releases/download/jdk8u232-b09/OpenJDK8U-jdk_x64_linux_8u232b09.tar.gz
tar xvfz OpenJDK8U-jdk_x64_linux_8u232b09.tar.gz 
mkdir -p /usr/lib/jvm
mv openjdk-8u232-b09 /usr/lib/jvm/
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/openjdk-8u232-b09/bin/java 1
sudo update-alternatives --set java /usr/lib/jvm/openjdk-8u232-b09/bin/java
java -version
