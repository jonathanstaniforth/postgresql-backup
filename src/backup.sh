MYDATE=`date +%d-%B-%Y`
MONTH=$(date +%B)
YEAR=$(date +%Y)
MYBASEDIR=/backups
MYBACKUPDIR=${MYBASEDIR}/${YEAR}/${MONTH}
mkdir -p ${MYBACKUPDIR}
cd ${MYBACKUPDIR}

FILENAME=database.${MYDATE}.dmp

PGHOST=database PGPORT=5432 PGDATABASE=public PGUSER=admin PGPASSWORD=admin pg_dump -w -c | gzip --best > ${FILENAME}.sql.gz