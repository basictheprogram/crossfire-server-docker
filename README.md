# Crossfire Server Docker Images

Find the Crossfire Server Docker images at:
  * [Crossfire Server Docker image in Docker Hub](https://hub.docker.com/repository/docker/basictheprogram/crossfire-server).

## Prerequisites

Docker is required. See the [official installation documentation](https://docs.docker.com/get-docker/).

## Set up the volumes

Before setting everything else, configure a new environment variable $CF_HOME pointing
to the directory where the configuration, game files, logs, and data files will reside. Ensure that the directory exists and appropriate permission have been granted.

For Linux users, set the path to /opt/gitlab:
```
export CF_HOME=/opt/crossfire
```

For macOS users, use the user’s $HOME/gitlab directory:
```
export CF_HOME=$HOME/gitlab
```

For window users, use XXXX:
```
Help me?
```

For Linux and macOS platforms set the hostname:
```
export CF_HOSTNAME=crossfire.metalforge.net
```

For windows set the hostname:
```
Help me?
```

The Crossfire Server container uses host mounted volumes to store persistent data:
| Local location     | Container location   | Usage                   |
| --------------     | ------------------   | -----
| $CF_HOME/gamefiles | /var/games/crossfire | For storing game files. |
| $CF_HOME/logfiles  | /var/log/crossfire   | For storing log files.  |

## Installation

### Install Crossfire Server using Docker Engine

You can fine tune these directories to meet your requirements. Once you’ve set up
the CF_HOME variable, you can run the image:

```
docker run --detach \
  --hostname $CF_HOSTNAME \
  --publish 13327:13327 \
  --name crossfire-server \
  --restart always \
  --volume $CF_HOME/gamefiles:/var/games/crossfire \
  --volume $CF_HOME/logfiles:/var/log/crossfire \
  --shm-size 256m \
   basictheprogram/crossfire-server:latest
```

This will download and start a Crossfire Server container and publish ports needed to
access TCP 13327. All Crossfire Server data will be stored as subdirectories of $CF_HOME.
The container will automatically restart after a system reboot.
