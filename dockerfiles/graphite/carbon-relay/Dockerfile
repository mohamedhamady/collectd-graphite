FROM local/carbon-base
MAINTAINER M.Hamady mhamady@xebia.fr

ARG destinations

COPY ./carbon.conf /opt/graphite/conf
RUN cp /opt/graphite/conf/relay-rules.conf.example /opt/graphite/conf/relay-rules.conf

COPY ./carbon_relay.service /etc/systemd/system/
COPY ./fix-destinations.sh /opt/graphite/bin/

RUN chmod +x /opt/graphite/bin/fix-destinations.sh 
RUN /opt/graphite/bin/fix-destinations.sh $destinations

RUN systemctl enable carbon_relay.service

EXPOSE 2003 2004 7002
