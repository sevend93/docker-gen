FROM tutum/debian:jessie

RUN rm -rf /etc/apt/sources.list \
	&& mkdir /app
	
COPY sources.list /etc/apt/sources.list

RUN apt-get update \
	&& rm -r /var/lib/apt/lists/* \
	&& apt-get clean

COPY app /app

RUN cd /app \
	&& tar zxvf docker-gen.tar.gz \
	&& cp /docker-gen /usr/local/bin/ \
	&& mkdir -p /etc/nginx/certs

WORKDIR /app/

CMD ["/app/start.sh"]
