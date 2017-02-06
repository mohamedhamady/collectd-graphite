FROM local/c7-systemd
MAINTAINER M.Hamady mhamady@xebia.fr


RUN yum -y install httpd \ 
    yum clean all

COPY conf /etc/httpd/conf
COPY conf.d /etc/httpd/conf.d
COPY conf.modules.d /etc/httpd/conf.modules.d
