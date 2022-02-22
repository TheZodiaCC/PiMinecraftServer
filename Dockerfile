FROM ubuntu:18.04
RUN mkdir server
WORKDIR /server
RUN apt update
RUN apt -y install wget nano
RUN wget https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.2%2B8/OpenJDK17U-jre_arm_linux_hotspot_17.0.2_8.tar.gz
RUN tar zxvf OpenJDK17U-jre_arm_linux_hotspot_17.0.2_8.tar.gz jdk-17.0.2+8-jre/
RUN export PATH=$PWD/jdk-17.0.2+8-jre/bin:$PATH
RUN echo eula=true > eula.txt
RUN wget https://launcher.mojang.com/v1/objects/125e5adf40c659fd3bce3e66e67a16bb49ecc1b9/server.jar
RUN rm OpenJDK17U-jre_arm_linux_hotspot_17.0.2_8.tar.gz
CMD ./jdk-17.0.2+8-jre/bin/java -Xmx1512M -Xms1512M -jar server.jar
