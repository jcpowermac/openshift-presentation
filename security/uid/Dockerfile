FROM docker.io/fedora:28


RUN dnf install -y python2-pip \
    @'C Development Tools and Libraries' \
    redhat-rpm-config \
    python2-devel \
    python-psycopg2 python-PyMySQL && \
    dnf clean all

RUN pip install -U setuptools ara==0.14.6

EXPOSE 8080

ENV APP_ROOT=/opt/app-root
ENV PATH=${APP_ROOT}/bin:${PATH} HOME=${APP_ROOT}
ENV ARA_PORT="8080"
ENV ARA_HOST="0.0.0.0"
ENV ARA_DIR=${APP_ROOT}

#COPY bin/ ${APP_ROOT}/bin/
RUN mkdir -p ${APP_ROOT}/.ansible/ && \
    mkdir -p ${APP_ROOT}/bin/ && \
    chmod -R 770 ${APP_ROOT} && \
    chgrp -R 0 ${APP_ROOT}
USER 10001

# I want this to break with a uid specific message
ENTRYPOINT [ "ara-manage" ]
CMD ["runserver"]

