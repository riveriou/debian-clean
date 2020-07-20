FROM debian:latest
MAINTAINER River Riou

RUN ln -snf /usr/share/zoneinfo/Asia/Taipei /etc/localtime && echo Asia/Taipei > /etc/timezone

RUN apt-get update --fix-missing

# curl is needed to download the xampp installer, net-tools provides netstat command for xampp
RUN apt-get -y install curl net-tools


# Few handy utilities which are nice to have
RUN apt-get -y install vim wget unzip --no-install-recommends
#JAVA
#RUN apt-get -y install default-jdk --no-install-recommends

RUN apt-get clean

