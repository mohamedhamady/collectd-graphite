FROM local/carbon-base
MAINTAINER M.Hamady mhamady@xebia.fr

ENV GRAPHITE_WEB /opt/graphite/webapp/graphite
ENV PYTHONPATH=/opt/graphite/webapp

RUN yum -y install cairo-devel httpd mod_wsgi python-twisted-core \
    yum clean all

COPY httpd /etc/httpd/

RUN git clone https://github.com/graphite-project/graphite-web.git "$PACKAGES_DIR/graphite-web"

RUN cd $PACKAGES_DIR/graphite-web && python setup.py install

RUN pip install cairocffi pyparsing django pytz  django-tagging

RUN cp $GRAPHITE_WEB/local_settings.py.example $GRAPHITE_WEB/local_settings.py
RUN cp /opt/graphite/conf/graphite.wsgi.example /opt/graphite/conf/graphite.wsgi

RUN echo "SECRET_KEY = 'K65pmu3fJdUFVUismSI0n8h3iTC55kavVZDsZSIEDdE'" >> $GRAPHITE_WEB/local_settings.py
#RUN echo "debug = true" >> $GRAPHITE_WEB/local_settings.py
RUN echo "TIME_ZONE = 'Europe/Paris'" >> $GRAPHITE_WEB/local_settings.py

RUN echo "Generating Database ..."
RUN cp $PACKAGES_DIR/graphite-web/webapp/manage.py $GRAPHITE_WEB/
RUN cd $GRAPHITE_WEB && ls -al
RUN cd $GRAPHITE_WEB && python manage.py migrate --run-syncdb
RUN echo "from django.contrib.auth.models import User; User.objects.create_superuser('mhamady', 'mhamady@xebia.fr', 'pass')" | $GRAPHITE_WEB/manage.py shell

RUN chown -R apache:apache /opt/graphite
RUN systemctl enable httpd

EXPOSE 80
