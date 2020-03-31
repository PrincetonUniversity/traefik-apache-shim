FROM httpd:2.4

RUN apt-get update -y \
    && apt-get install -y libapache2-mod-auth-cas ca-certificates\
            libssl-dev libapache2-mod-fcgid \
    && rm -rf /var/cache/apk/* \
    && mkdir /tmp/cas && chown www-data:www-data /tmp/cas

COPY ./http2.4.conf /usr/local/apache2/conf/httpd.conf

COPY pni-apache.Dockerfile /Dockerfile
