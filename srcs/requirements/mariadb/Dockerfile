FROM debian:12.11

RUN apt update && apt upgrade && apt install -y \
    mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/init.sql /etc/mysql/init.sql
COPY tools/mariadb_script.sh .

RUN mkdir /run/mysqld && chmod +x mariadb_script.sh

EXPOSE 3306

CMD ["./mariadb_script.sh"]
