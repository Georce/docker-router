#/**
# *
# * ━━━━━━神兽出没━━━━━━
# * 　　　┏┓　　　┏┓
# * 　　┏┛┻━━━┛┻┓
# * 　　┃　　　　　　　┃
# * 　　┃　　　━　　　┃
# * 　　┃　┳┛　┗┳　┃
# * 　　┃　　　　　　　┃
# * 　　┃　　　┻　　　┃
# * 　　┃　　　　　　　┃
# * 　　┗━┓　　　┏━┛Code is far away from bug with the animal protecting
# * 　　　　┃　　　┃    神兽保佑,代码无bug
# * 　　　　┃　　　┃
# * 　　　　┃　　　┗━━━┓
# * 　　　　┃　　　　　　　┣┓
# * 　　　　┃　　　　　　　┏┛
# * 　　　　┗┓┓┏━┳┓┏┛
# * 　　　　　┃┫┫　┃┫┫
# * 　　　　　┗┻┛　┗┻┛
# *
# * ━━━━━━感觉萌萌哒━━━━━━
# */
FROM index.alauda.cn/library/debian:6

MAINTAINER 谁改谁去死！

RUN sed -i s@httpredir.debian.org@mirrors.aliyun.com@g /etc/apt/sources.list

RUN apt-get update

RUN apt-get install -y quagga

COPY daemons /etc/quagga/daemons

COPY ospfd.conf /etc/quagga/ospfd.conf

COPY ripd.conf /etc/quagga/ripd.conf

COPY run.sh /opt/run.sh

RUN cp /usr/share/doc/quagga/examples/zebra.conf.sample /etc/quagga/zebra.conf

RUN chmod 755 /opt/run.sh

RUN chown quagga:quagga /etc/quagga/*.conf

CMD ["/opt/run.sh"]
