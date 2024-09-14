FROM alpine

RUN apk update && apk add lighttpd rsync

CMD [ "lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf" ]
EXPOSE 80

WORKDIR /var/www/localhost/htdocs

COPY . img/

RUN mv img/docker/lighttpd.conf img/docker/mime-types.conf /etc/lighttpd/ && rm -rf img/docker/
