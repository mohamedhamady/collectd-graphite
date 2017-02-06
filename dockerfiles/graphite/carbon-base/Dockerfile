FROM local/c7-systemd
MAINTAINER M.Hamady mhamady@xebia.fr

ENV PACKAGES_DIR /opt/packages

RUN yum -y install python-twisted-core \
    yum clean all

RUN mkdir $PACKAGES_DIR

RUN git clone https://github.com/graphite-project/carbon.git "$PACKAGES_DIR/carbon"
RUN git clone https://github.com/graphite-project/whisper.git "$PACKAGES_DIR/whisper"
RUN git clone https://github.com/graphite-project/ceres.git "$PACKAGES_DIR/ceres"

RUN cd $PACKAGES_DIR/carbon && python setup.py install
RUN cd $PACKAGES_DIR/whisper && python setup.py install
RUN cd $PACKAGES_DIR/ceres && python setup.py install

COPY ./storage-aggregation.conf /opt/graphite/conf
COPY ./storage-schemas.conf  /opt/graphite/conf