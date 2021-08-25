FROM debian:latest
MAINTAINER River Riou

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

RUN ln -snf /usr/share/zoneinfo/Asia/Taipei /etc/localtime && echo Asia/Taipei > /etc/timezone

RUN apt-get update --fix-missing

# curl is needed to download the xampp installer, net-tools provides netstat command for xampp
RUN apt-get -y install curl net-tools git


# Few handy utilities which are nice to have
RUN apt-get -y install vim wget unzip --no-install-recommends
#JAVA
RUN apt-get -y install default-jdk --no-install-recommends

RUN apt-get clean
# Mc Spigot-BuildTools
WORKDIR /minecraft
RUN cd minecraft
RUN wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

RUN java -jar BuildTools.jar
RUN cp spigot*.jar spigot.jar
RUN echo 'EULA=TRUE' > eula.txt
CMD ["java -Xmx2048M -Xms1024M -jar /minecraft/spigot.jar"]
