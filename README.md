# SQL
- MySQL Docker
```
docker run   --name inflearn_db   -e MYSQL_ROOT_PASSWORD=1234   -e MYSQL_DATABASE=hands_on   -v local_db:/var/lib/mysql   -p 3306:3306   -d   mysql:8.0
```
