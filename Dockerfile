FROM ubuntu:16.04
MAINTAINER Sathish Kumar <sathish26586@gmail.com>

#Install Nginx

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx && \
    && rm -rf /var/lib/apt/lists/*

ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

ADD data/www /var/www/html

RUN rm /etc/nginx/sites-enabled/default

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
