# docker-mydumper

[mydumper](https://github.com/maxbube/mydumper) in a Docker container.

Usage:

    docker run --rm alexanderfefelov/mydumper mydumper --help

    docker run --rm \
      --volume HOST_BACKUP_DIRECTORY:/backup \
      alexanderfefelov/mydumper \
      mydumper \
        --output=/backup \
        --host=HOSTNAME \
        --user=USERNAME \
        --password=PASSWORD
