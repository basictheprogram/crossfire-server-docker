FROM ubuntu:jammy

LABEL maintainer="tanner@real-time.com"
LABEL version="0.1"
LABEL description="Docker Image for Crossfire"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt --yes update && apt --yes dist-upgrade
RUN apt install -y crossfire-server && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean

ENV nginx_vhost /etc/nginx/sites-available/default

VOLUME ["/var/games/crossfire/", "/var/log/crossfire"]

EXPOSE 13327

RUN mkdir /app
COPY entrypoint.sh /app
RUN chmod +x /app/entrypoint.sh
RUN touch /var/games/crossfire/highscore || true
RUN mkdir /var/games/crossfire/datafiles || true
RUN mkdir /var/games/crossfire/players || true
RUN mkdir /var/games/crossfire/unique-items || true
RUN chown -R games:games /var/games/crossfire

CMD [ "/app/entrypoint.sh" ]
