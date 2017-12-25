FROM nvidia/cuda:9.0-runtime-ubuntu16.04

RUN apt-get update && apt-get install -y \
        gnuplot \
	lighttpd \
        vim && \
        rm -rf /var/lib/apt/lists/*

# RUN echo server.network-backend = \"writev\" >> /etc/lighttpd/lighttpd.conf

COPY lighttpd/* /etc/lighttpd/

COPY index.html /var/www/

COPY scripts/* /opt/

COPY run.sh /

EXPOSE 80

VOLUME /var/www

CMD ["/run.sh"]
