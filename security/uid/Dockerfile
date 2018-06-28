FROM docker.io/fedora:28


RUN dnf install -y python2-pip \
    @'C Development Tools and Libraries' \
    redhat-rpm-config \
    python2-devel \
    python-psycopg2 python-PyMySQL && \
    dnf clean all

RUN pip install -U setuptools ara==0.14.6

EXPOSE 8080
USER 10001

# This will break because of random uid...
ENTRYPOINT [ "ara-manage" ]
CMD runserver

