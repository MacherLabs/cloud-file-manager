FROM alpine:3.6
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        zip \
        && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
RUN chmod +x *.sh 
# RUN sh mongobackup.sh >>mongobackup.log 2>&1
# ENTRYPOINT ["sh", "/mongobackup/docker-entrypoint.sh", ">>mongobackup.log", "2>&1"]
ENTRYPOINT ["sh", "/mongobackup/docker-entrypoint.sh"] 

