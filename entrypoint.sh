#!/bin/bash

APP_PORT=${PORT:-13327}

su - games -s /bin/bash -c /usr/sbin/crossfire-server
