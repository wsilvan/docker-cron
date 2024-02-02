FROM ubuntu:latest

RUN apt-get update \  
    && apt-get install cron -y && apt-get install vim -y

COPY ./files/cronjobfile /etc/cron.d/container_cronjob
COPY ./files/script.sh /script.sh
RUN chmod +x /script.sh
CMD ["/bin/bash", "-c", "/script.sh && chmod 644 /etc/cron.d/container_cronjob && cron && tail -f /var/log/cron.log"]
