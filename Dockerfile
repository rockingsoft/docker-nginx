FROM nginx

MAINTAINER Sebastian Choren "sebastianchoren@gmail.com"


ENV LANG C.UTF-8

RUN apt-get update; apt-get install -y \
    openssl

ADD cors.conf /etc/nginx/conf.d/cors.conf
ADD ssl.conf /etc/nginx/conf.d/ssl.conf
ADD default.conf /etc/nginx/conf.d/default.conf
ADD setup.sh /setup.sh
RUN bash /setup.sh

EXPOSE 443