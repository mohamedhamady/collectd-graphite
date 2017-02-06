FROM local/carbon-base
MAINTAINER M.Hamady mhamady@xebia.fr

ARG instance

COPY ./carbon.conf /opt/graphite/conf
COPY ./carbon_cache@.service /etc/systemd/system/
COPY ./fix-storage-dir.sh /opt/graphite/bin/

RUN chmod +x /opt/graphite/bin/fix-storage-dir.sh
RUN /opt/graphite/bin/fix-storage-dir.sh $instance

RUN systemctl enable carbon_cache@$instance.service

EXPOSE 2003 2004 7002
