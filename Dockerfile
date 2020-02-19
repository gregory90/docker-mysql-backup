FROM gregory90/base:buster

RUN mkdir /app && \
    wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb -qO /app/xtrabackup && \
    dpkg -i /app/xtrabackup && \
    percona-release enable-only tools release && \
    apt-get update && \
    apt-get install percona-xtrabackup-80


ADD run /app/run
ADD restore /app/restore
ADD my.cnf /app/my.cnf
RUN chmod +x /app/run
RUN chmod +x /app/restore
RUN mkdir /backup
