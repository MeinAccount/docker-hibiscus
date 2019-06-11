# Docker Hibiscus
[Hibiscus](https://www.willuhn.de/products/hibiscus-server/) on OpenJDK 11 using a MySQL or MariaDB-Database.
Create tables running the `create-tables.sh` script.

ENV to set:

Hibiscus application parameters
- PASSWORD
- [USE_SSL = FALSE]

Databse connection parameters
- DB_HOST, like 192.168.5.5
- DB_NAME
- DB_USERNAME
- DB_PASSWORD
- [DB_PORT = 3306]
