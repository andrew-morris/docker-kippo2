FROM ubuntu:trusty
MAINTAINER Andrew Morris <morr.drew@gmail.com>

RUN apt-get update && apt-get -q -y install python-dev openssl python-openssl python-pyasn1 python-twisted git

# RUN useradd -d /kippo -s /bin/bash -m kippo -g sudo
# RUN git clone https://github.com/micheloosterhof/kippo /opt/kippo
RUN git clone https://github.com/andrew-morris/docker-kippo2 /opt/kippo
RUN mv /opt/kippo/kippo.cfg.dist /opt/kippo/kippo.cfg
VOLUME ["/logs"]

EXPOSE 2222

#USER kippo
WORKDIR /opt/kippo
CMD ["twistd", "--nodaemon", "-y", "kippo.tac", "--pidfile=kippo.pid"]
