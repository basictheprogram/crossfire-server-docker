FROM ubuntu:jammy

LABEL maintainer="tanner@real-time.com"
LABEL version="0.1"
LABEL description="Docker Image for Crossfire"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt --yes update && apt --yes dist-upgrade
RUN apt --yes update && \
    apt install -y crossfire-server && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean

ENV nginx_vhost /etc/nginx/sites-available/default

VOLUME ["/var/games/crossfire/", "/var/log/crossfire"]

EXPOSE 13327

RUN install -d /app
COPY entrypoint.sh /app
RUN chmod +x /app/entrypoint.sh
RUN touch /var/games/crossfire/highscore
RUN intall -d /var/games/crossfire/datafiles
RUN intall -d /var/games/crossfire/players
RUN install -d /var/games/crossfire/unique-items
RUN chown -R games:games /var/games/crossfire

CMD [ "/app/entrypoint.sh" ]
