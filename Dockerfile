FROM java:openjdk-8-jdk

RUN apt-get update && apt-get install -y \
  mysql-client

ENV	HIBISCUS_VERSION 2.8.7
ENV	HIBISCUS_DOWNLOAD_SHA256 df9db1a9eefefe7a14581006ed46f86f41db4162

RUN curl -fsSL https://www.willuhn.de/products/hibiscus-server/releases/hibiscus-server-$HIBISCUS_VERSION.zip -o hibiscus-server.zip
RUN echo "$HIBISCUS_DOWNLOAD_SHA256 hibiscus-server.zip" | sha1sum -c -
RUN unzip hibiscus-server.zip -d /
RUN rm hibiscus-server.zip

RUN echo "Europe/Berlin" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

COPY ./docker-entrypoint.sh /
COPY ./create-tables.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8080
