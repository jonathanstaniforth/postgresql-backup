FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y wget cron gnupg2 lsb-core && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |tee  /etc/apt/sources.list.d/pgdg.list

RUN apt-get update && \
    apt-get install -y postgresql-client-12

WORKDIR /etc/cron.d
COPY src/backup-cron .
RUN chmod 0644 ./backup-cron

WORKDIR /backup-cron
COPY src/backup.sh .
RUN chmod 777 ./backup.sh

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

CMD ["cron", "-f"]