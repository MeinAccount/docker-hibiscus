FROM openjdk:8-jre

ENV   HIBISCUS_VERSION 2.10.0
ENV   HIBISCUS_CHECKSUM '55c5e89e7df6152464430cce6e8d6a171c5c5e3a *hibiscus-server-2.10.0.zip'
ENV   MARIADB_JDBC_VERSION 2.7.1
ENV   MARIADB_CHECKSUM '3b8c972f7518d4e0e2a070e9e877ebcfba2d2db8 *mariadb-java-client-2.7.1.jar'

RUN   curl -fsSL https://www.willuhn.de/products/hibiscus-server/releases/hibiscus-server-$HIBISCUS_VERSION.zip -o hibiscus-server-$HIBISCUS_VERSION.zip &&\
      echo "$HIBISCUS_CHECKSUM" | sha1sum -c - &&\
      unzip hibiscus-server-$HIBISCUS_VERSION.zip -d / &&\
      rm hibiscus-server-$HIBISCUS_VERSION.zip

RUN   apt-get update && apt-get install -y \
  	mariadb-client

RUN   curl https://downloads.mariadb.com/Connectors/java/connector-java-$MARIADB_JDBC_VERSION/mariadb-java-client-$MARIADB_JDBC_VERSION.jar -o mariadb-java-client-$MARIADB_JDBC_VERSION.jar &&\
      echo "$MARIADB_CHECKSUM" | sha1sum -c - &&\
      mv mariadb-java-client-$MARIADB_JDBC_VERSION.jar /hibiscus-server/lib/mysql/mariadb-java-client.jar &&\

      echo "Europe/Berlin" > /etc/timezone &&\
      dpkg-reconfigure -f noninteractive tzdata

COPY  ./policy /
COPY  ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8080
