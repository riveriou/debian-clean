FROM debian:latest
MAINTAINER River Riou

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

RUN ln -snf /usr/share/zoneinfo/Asia/Taipei /etc/localtime && echo Asia/Taipei > /etc/timezone

RUN apt-get update --fix-missing && apt-get -y install curl net-tools vim wget unzip

#JAVA
#RUN apt-get -y install default-jdk --no-install-recommends
#LNMP 無人值守安裝
#RUN wget http://soft.vpser.net/lnmp/lnmp1.7.tar.gz -cO lnmp1.7.tar.gz && tar zxf lnmp1.7.tar.gz && cd lnmp1.7 && LNMP_Auto="y" DBSelect="10" DB_Root_Password="test" InstallInnodb="y" PHPSelect="10" SelectMalloc="3" ./install.sh lnmp

RUN apt-get clean
RUN echo "set pastetoggle=<F11> " >> ~/.vimrc
