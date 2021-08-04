FROM ubuntu:18.04
RUN mkdir server
WORKDIR /server
RUN apt update
RUN apt -y install wget nano
RUN wget https://github.com/AdoptOpenJDK/openjdk16-binaries/releases/download/jdk-16.0.1%2B9/OpenJDK16U-jre_arm_linux_hotspot_16.0.1_9.tar.gz
RUN tar zxvf OpenJDK16U-jre_arm_linux_hotspot_16.0.1_9.tar.gz jdk-16.0.1+9-jre/
RUN export PATH=$PWD/jdk-16.0.1+9-jre/bin:$PATH
RUN echo eula=true > eula.txt
RUN wget https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar
RUN rm OpenJDK16U-jre_arm_linux_hotspot_16.0.1_9.tar.gz
CMD ./jdk-16.0.1+9-jre/bin/java -Xmx1024M -Xms1024M -jar server.jar
