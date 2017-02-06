FROM local/c7-systemd
MAINTAINER M.Hamady mhamady@xebia.fr

RUN mkdir /opt/packages 

COPY jdk-8u111-linux-x64.tar.gz /opt/packages/
COPY install-java.sh /opt/packages/
RUN chmod +x /opt/packages/install-java.sh
RUN /opt/packages/install-java.sh
ENV JAVA_HOME /opt/jdk8
