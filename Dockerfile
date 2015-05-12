FROM  armbuild/archlinux-disk

USER root

RUN pacman -Syu --noconfirm
RUN pacman-db-upgrade

RUN pacman -S --noconfirm cron git wiringpi

RUN mkdir /opt/train-alerts
WORKDIR /opt/train-alerts

RUN touch .env

RUN mkdir -p libs/redi.sh
RUN git clone https://github.com/crypt1d/redi.sh.git libs/redi.sh

RUN touch /var/log/cron.log

COPY dist /opt/train-alerts/
COPY brightness.cron /etc/cron.d/brightness

RUN chmod +x /opt/train-alerts/set_env.sh
RUN chmod +x /opt/train-alerts/bin/brightness.sh

## Docker env variables are not available via cron - set the values we need in the cron template

CMD ./set_env.sh /opt/train-alerts/.env && echo "mod-brightness=256" | libs/redi.sh/redi.sh -H $DB_PORT_6379_TCP_ADDR && /usr/bin/crond -n && tail -f /var/log/cron.log