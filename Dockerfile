FROM gregory90/base:wheezy

RUN mkdir /app && \
    apt-get update && \
    apt-get install -y -q libdbd-mysql-perl libaio1 rsync libev4 libgcrypt11  && \
    wget https://www.percona.com/downloads/XtraBackup/XtraBackup-2.2.3/binary/debian/wheezy/x86_64/percona-xtrabackup_2.2.3-4982-1.wheezy_amd64.deb -qO /app/xtrabackup && \
    dpkg -i /app/xtrabackup


ADD run /app/run
ADD restore /app/restore
ADD my.cnf /app/my.cnf
RUN chmod +x /app/run
RUN chmod +x /app/restore
RUN mkdir /backup
