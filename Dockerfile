FROM ubuntu:17.10

ADD http://nginx.org/keys/nginx_signing.key .

RUN  set -xe && \
    apt-get -y update && \
    apt-get -y install --reinstall ca-certificates

ADD unit.list /etc/apt/sources.list.d/

RUN set -xe && \
    apt-key add nginx_signing.key &&\
    apt-get -y update && \
    apt-get -y install  mc curl \
                        python3.6 \
                        unit \
                        unit-python3.6 \ 
                        python3-pip

CMD ["/usr/sbin/unitd", "--no-daemon", "--control", "0.0.0.0:8300"]
