FROM openjdk:11-jre

RUN apt-get update && apt-get install -y \
  mariadb-client

ENV	HIBISCUS_RELEASE 2.10
ENV	HIBISCUS_VERSION 2.10.0
ENV	HIBISCUS_DOWNLOAD_SHA256 41c67808ec3b0f3c8df475f8457b0de8667c2b90

RUN curl -fsSL https://www.willuhn.de/products/hibiscus-server/releases/$HIBISCUS_RELEASE/hibiscus-server-$HIBISCUS_VERSION.zip -o hibiscus-server.zip
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
