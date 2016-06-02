FROM java:openjdk-7-jre

ENV	HIBISCUS_VERSION 2.6.16
ENV	HIBISCUS_DOWNLOAD_SHA256 2897fb25bd3b75b8733298248d1c0df48c1f52ea

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    unzip \
 && curl -fsSL https://www.willuhn.de/products/hibiscus-server/releases/hibiscus-server-$HIBISCUS_VERSION.zip -o hibiscus-server.zip \
 && echo "$HIBISCUS_DOWNLOAD_SHA256 hibiscus-server.zip" | sha1sum -c - \
 && unzip hibiscus-server.zip -d / \
 && rm hibiscus-server.zip

RUN echo "Europe/Berlin" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8080
