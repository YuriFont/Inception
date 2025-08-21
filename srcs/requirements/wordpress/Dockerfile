FROM debian:12.11

RUN apt update && apt upgrade && apt install -y \
    php-fpm \
    php-mysqli \
    curl \
    ca-certificates

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/.
COPY tools/wp-cli_script.sh .
RUN chmod +x wp-cli_script.sh

EXPOSE 9000

CMD ["./wp-cli_script.sh"]
