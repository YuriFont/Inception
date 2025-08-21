FROM debian:12.11

RUN apt update && apt upgrade && apt install -y \
    nginx openssl

COPY conf/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
