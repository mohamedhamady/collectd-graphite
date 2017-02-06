FROM local/java
MAINTAINER M.Hamady mhamady@xebia.fr

RUN mkdir -p /opt/packages

RUN pip install psutil

ADD https://collectd.org/files/collectd-5.5.3.tar.gz  /opt/packages
RUN cd /opt/packages/ && tar -xzf collectd-5.5.3.tar.gz
RUN cd /opt/packages/collectd-5.5.3 && ls -al && ./configure --enable-java --enable-python --with-python=/usr/bin/python2.7 --enable-debug
RUN cd /opt/packages/collectd-5.5.3 && make all install

RUN mkdir /opt/collectd/share/python
COPY ./collectd /opt/collectd/etc/
COPY ./collectd.service /etc/systemd/system/
COPY ./virtual_memory.py /opt/collectd/share/python/

RUN systemctl enable collectd.service
