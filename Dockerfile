FROM ubuntu:xenial

MAINTAINER Carlos Ortigoza "carlos.ortigoza@ungleich.ch"

RUN apt-get update \
	&& apt-get install --no-install-recommends -y tftpd-hpa \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

VOLUME /var/lib/tftpboot

EXPOSE 69/udp

ENTRYPOINT ["in.tftpd"]
CMD ["--foreground", "--user", "root", "--verbose", "--secure", "/var/lib/tftpboot"]
