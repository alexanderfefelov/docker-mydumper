FROM debian:10.4-slim

ENV MYDUMPER_VERSION=0.9.5
ENV MYDUMPER_REVISION=2

ENV STUFF=mydumper_$MYDUMPER_VERSION-$MYDUMPER_REVISION.stretch_amd64.deb
ADD https://github.com/maxbube/mydumper/releases/download/v$MYDUMPER_VERSION/$STUFF /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       libatomic1 \
       libglib2.0-0 \
       libssl1.1 \
  && dpkg --install /$STUFF \
  && rm --force /$STUFF \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]
