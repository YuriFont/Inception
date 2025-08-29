FROM debian:12.11

RUN apt update && apt upgrade -y && \
    apt install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/certs

ARG SERVER_NAME=localhost
RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/certs/privkey.pem \
    -out /etc/nginx/certs/fullchain.pem \
    -subj "/CN=${SERVER_NAME}"

COPY conf/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
