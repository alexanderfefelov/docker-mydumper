FROM debian:stretch-slim

ENV VERSION=0.9.5
ENV REVISION=2

ENV DEB_FILE=mydumper_$VERSION-$REVISION.stretch_amd64.deb
ADD https://github.com/maxbube/mydumper/releases/download/v$VERSION/$DEB_FILE /

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update \
  && apt-get install -qq --yes --no-install-recommends libatomic1 libssl1.1 libglib2.0-0 \
  && dpkg -i /$DEB_FILE \
  && rm --force /$DEB_FILE \
  && apt-get -qq clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]
