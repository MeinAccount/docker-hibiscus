#!/bin/bash
set -e

mysql -h $DB_HOST -u $DB_USERNAME -p$DB_PASSWORD $DB_NAME < /hibiscus-server/plugins/hibiscus/sql/mysql-create.sql
