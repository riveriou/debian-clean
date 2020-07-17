FROM debian:latest
MAINTAINER River Riou

RUN apt-get update --fix-missing

# curl is needed to download the xampp installer, net-tools provides netstat command for xampp
RUN apt-get -y install curl net-tools


# Few handy utilities which are nice to have
RUN apt-get -y install nano vim less --no-install-recommends

RUN apt-get clean
