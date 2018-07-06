FROM docker.io/fedora:28


RUN dnf install -y python2-pip \
    @'C Development Tools and Libraries' \
    redhat-rpm-config \
    python2-devel \
    python-psycopg2 python-PyMySQL && \
    dnf clean all

