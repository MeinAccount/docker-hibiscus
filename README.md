# Docker Hibiscus
[Hibiscus](https://www.willuhn.de/products/hibiscus-server/) on OpenJDK 8 using a MySQL-Database.
Create tables running the `create-tables.sh` script.

ENV to set:

Hibiscus application parameters
- PASSWORD
- [USE_SSL = FALSE]

Databse connection parameters (assumption: using MariaDB / MySQL)
- DB_HOST, like 192.168.5.5
- DB_NAME
- DB_USERNAME
- DB_PASSWORD
- [DB_PORT = 3306]
