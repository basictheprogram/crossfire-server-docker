#!/bin/bash

APP_PORT=${PORT:-13327}

touch /var/games/crossfire/highscore
chown games:games /var/games/crossfire/highscore

su - games -s /bin/bash -c /usr/sbin/crossfire-server
