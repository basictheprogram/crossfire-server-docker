FROM ubuntu:jammy

LABEL maintainer="tanner@real-time.com"
LABEL version="0.1"
LABEL description="Docker Image for the Crossfire Server"

ARG DEBIAN_FRONTEND=noninteractive

RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes \
    && apt-get update -qq \
    && apt-get dist-upgrade -qq \
    && apt-get install -qq  --no-install-recommends \
        crossfire-server \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/var/games/crossfire/", "/var/log/crossfire"]

EXPOSE 13327

COPY entrypoint.sh /app

RUN install -d /app \
    && chmod +x /app/entrypoint.sh \
    && touch /var/games/crossfire/highscore \
    && install -d /var/games/crossfire/datafiles \
    && install -d /var/games/crossfire/players \
    && install -d /var/games/crossfire/unique-items \
    && chown -R games:games /var/games/crossfire

CMD [ "/app/entrypoint.sh" ]
