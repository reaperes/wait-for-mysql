FROM alpine:3.8
#FROM mysql:5.7

LABEL maintainer="reaperes105@gmail.com"

#RUN \
#  adduser -h /home/mysql -s /sbin/nologin -u 1000 -D mysql && \
#  apk add --no-cache \
#    mariadb-client

RUN apk update && apk add mysql-client && rm -f /var/cache/apk/*

#COPY wait-for-mysql /home/mysql/wait-for-mysql
#RUN chmod +x /home/mysql/wait-for-mysql
COPY wait-for-mysql /wait-for-mysql
RUN chmod +x /wait-for-mysql
COPY test.sh /test.sh
RUN chmod +x /test.sh

#USER mysql
#WORKDIR /home/mysql
#ENTRYPOINT ["/wait-for-mysql"]
ENTRYPOINT ["/test.sh"]
