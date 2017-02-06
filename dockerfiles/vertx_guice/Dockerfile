FROM local/collectd
MAINTAINER M.Hamady mhamady@xebia.fr

RUN mkdir /opt/app

ADD http://downloads.sourceforge.net/project/cyclops-group/jmxterm/1.0-alpha-4/jmxterm-1.0-alpha-4-uber.jar /opt/app
COPY ./vertx-guice-fat.jar /opt/app
COPY ./vertx_guice.service /etc/systemd/system/
COPY ./jmx.conf /opt/collectd/etc/conf.d/

RUN systemctl enable vertx_guice.service

EXPOSE 8080 9200
