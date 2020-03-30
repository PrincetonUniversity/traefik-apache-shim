FROM httpd:2.4


RUN apt-get update -y \
    && apt-get install -y libapache2-mod-fcgid \
    && rm -rf /var/cache/apk/*

COPY ./httpd2.4.conf /usr/local/apache2/conf/httpd.conf

COPY pni-apache.rt.Dockerfile /Dockerfile
