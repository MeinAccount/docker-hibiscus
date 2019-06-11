#!/bin/bash
set -e
DB_PORT=${DB_PORT:-3306}
$USE_SSL=${USE_SSL:-"false"}

cat > /hibiscus-server/cfg/de.willuhn.jameica.hbci.rmi.HBCIDBService.properties <<EOF
database.driver=de.willuhn.jameica.hbci.server.DBSupportMySqlImpl
database.driver.mysql.jdbcurl=jdbc\:mysql\://${DB_HOST}:${DB_PORT}/${DB_NAME}?useUnicode\=Yes&characterEncoding\=ISO8859_1
database.driver.mysql.username=${DB_USERNAME}
database.driver.mysql.password=${DB_PASSWORD}
EOF

cat > /hibiscus-server/cfg/de.willuhn.jameica.webadmin.Plugin.properties <<EOF
listener.http.address=0.0.0.0
listener.http.port=8080
listener.http.auth=true
listener.http.ssl=$USE_SSL
EOF

cd /hibiscus-server
java -Djava.net.preferIPv4Stack=true -Xmx512m -Djava.security.policy=file:///policy $_JCONSOLE -jar jameica-linux.jar -d -p $PASSWORD -f /srv/hibiscus
