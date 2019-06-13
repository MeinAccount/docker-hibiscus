#!/bin/bash
set -e
DB_PORT=${DB_PORT:-3306}

mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_USERNAME --password=$DB_PASSWORD $DB_NAME < /hibiscus-server/plugins/hibiscus/sql/mysql-create.sql
