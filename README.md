# README
A Docker Image to regularly backup remote PostgreSQL 12 databases.

## Prerequisites
The following are required to use this project:

* Docker Engine
* Docker Compose
* A PostgreSQL 12 database

## Setup
```bash
git clone https://github.com/jonathanstaniforth/postgresql-backup.git

cd postgresql-backup

docker build -t postgresql-backup .

docker run -v ./backups:/backups postgresql-backup
```

> Alternatively, you can pull the Docker Image and run directly, found under packages, without having to build from source.

## Details
This image establishes a cron job that executes a bash script at a set interval.
The interval is set to 11pm every dayby default. To change the interval, edit the file: **src/backup-cron**.

The backup script remotely connects to the databases and dumps the data, passing it through gzip to compress the file size.

> Change the database connection details in **src/backup.sh**.

The backups will be stored in the **/backups** folder of the Docker Image, which is mapped to the **./backups** folder on the host machine.

An example of how this Docker Image can be run with a PostgreSQL Docker container is shown in the **docker-compose.yml** file, and can be run as follows:

```bash
docker-compose up
```

## License
A Docker Image to regularly backup remote PostgreSQL databases.
Copyright (C) 2020 Jonathan Staniforth

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
