#!/bin/bash
set -e
DB_PORT=${1:-"3306"}

mysql -h $DB_HOST -P $DB_PORT -u $DB_USERNAME -p $DB_PASSWORD $DB_NAME < /hibiscus-server/plugins/hibiscus/sql/mysql-create.sql
