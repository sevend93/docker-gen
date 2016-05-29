#!/bin/sh
setsid docker-gen -watch -only-exposed /app/nginx.tmpl /app/default.conf
sh /run.sh
