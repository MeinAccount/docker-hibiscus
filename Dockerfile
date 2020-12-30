FROM openjdk:11-jre

RUN apt-get update && apt-get install -y \
  mariadb-client

ENV	HIBISCUS_VERSION 2.10.0
ENV	HIBISCUS_DOWNLOAD_SHA256 55c5e89e7df6152464430cce6e8d6a171c5c5e3a

RUN curl -fsSL https://www.willuhn.de/products/hibiscus-server/releases/hibiscus-server-$HIBISCUS_VERSION.zip -o hibiscus-server.zip
RUN echo "$HIBISCUS_DOWNLOAD_SHA256 hibiscus-server.zip" | sha1sum -c -
RUN unzip hibiscus-server.zip -d /
RUN rm hibiscus-server.zip

RUN echo "Europe/Berlin" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

COPY ./docker-entrypoint.sh /
COPY ./create-tables.sh /
COPY ./policy /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8080
