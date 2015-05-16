FROM debian:jessie

MAINTAINER 谁改谁去死！

RUN apt-get update

RUN apt-get install -y quagga

COPY daemons /etc/quagga/daemons

COPY ospfd.conf /etc/quagga/ospfd.conf

COPY ripd.conf /etc/quagga/ripd.conf

COPY run.sh /opt/run.sh

RUN chmod 755 /opt/run.sh

RUN chown quagga:quagga /etc/quagga/*.conf

CMD ["/opt/run.sh"]
