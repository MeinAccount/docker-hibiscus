FROM openjdk:11-jre

RUN apt-get update && apt-get install -y \
  mysql-client

ENV	HIBISCUS_VERSION 2.8.16
ENV	HIBISCUS_DOWNLOAD_SHA256 5d0cba98916c111e3fa56578ea0a64abe9c3d06f

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
