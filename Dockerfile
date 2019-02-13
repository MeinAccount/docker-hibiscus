FROM java:openjdk-8-jdk

RUN apt-get update && apt-get install -y \
  mysql-client

ENV	HIBISCUS_VERSION 2.8.10
ENV	HIBISCUS_DOWNLOAD_SHA256 f517b6d079f30b7c42a7753a722012b5de2f3194

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
