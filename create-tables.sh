#!/bin/bash
set -e
mysql --host=$DB_HOST --port=${DB_PORT:-"3306"} -u $DB_USERNAME -p$DB_PASSWORD $DB_NAME < /hibiscus-server/plugins/hibiscus/sql/mysql-create.sql
