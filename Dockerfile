FROM jakubzapletal/ubuntu:14.04.1

MAINTAINER Jakub Zapletal <zapletal.jakub@gmail.com>

# Install Java8
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN apt-get update
RUN apt-get install oracle-java8-installer -y
RUN update-java-alternatives -s java-8-oracle
RUN apt-get install oracle-java8-set-default

# Define default command.
CMD ["bash"]
