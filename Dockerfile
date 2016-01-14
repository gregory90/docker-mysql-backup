FROM gregory90/base

RUN mkdir /app && \
    apt-get update && \
    apt-get install -y -q libdbd-mysql-perl libaio1 rsync libev4  && \
    wget https://www.percona.com/downloads/XtraBackup/Percona-XtraBackup-2.3.3/binary/debian/jessie/x86_64/percona-xtrabackup_2.3.3-1.jessie_amd64.deb -qO /app/xtrabackup && \
    dpkg -i /app/xtrabackup


ADD run /app/run
ADD restore /app/restore
ADD my.cnf /app/my.cnf
RUN chmod +x /app/run
RUN chmod +x /app/restore
