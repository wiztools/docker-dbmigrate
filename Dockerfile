FROM debian:stretch

RUN apt-get update
RUN apt-get install -y wget

RUN mkdir /app
WORKDIR /app
RUN wget https://github.com/mattes/migrate/releases/download/v3.0.1/migrate.linux-amd64.tar.gz
RUN tar -xzf migrate.linux-amd64.tar.gz
RUN mv migrate.linux-amd64 /usr/bin/migrate
RUN apt-get remove -y wget

RUN mkdir -p db/migrations
COPY dkr-migrate.sh dkr-migrate.sh
# This needs to be part of the extended image:
# COPY db/migrations/*.sql db/migrations/

ENTRYPOINT ["./dkr-migrate.sh"]
CMD ["up"]
