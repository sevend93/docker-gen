FROM tutum/debian:jessie

RUN apt-get update \
    && rm -r /var/lib/apt/lists/* \
    && apt-get clean

COPY app /app

RUN cd /app \
    && tar zxvf docker-gen.tar.gz \
    && cp docker-gen /usr/local/bin/ \
    && rm -rf docker-gen \
    && rm -rf docker-gen.tar.gz \
    && mkdir -p /etc/nginx/certs \
    && sed -i '1a nohup docker-gen -watch -only-exposed /app/nginx.tmpl /data/default.conf &' /run.sh

CMD ["/run.sh"]
