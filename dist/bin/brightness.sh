#!/bin/bash

function set_brightness {
  bright_value=$(/opt/train-alerts/libs/redi.sh/redi.sh -H $DB_PORT_6379_TCP_ADDR -P $DB_PORT_6379_TCP_PORT -g mod-brightness);
  gpio -g pwm 18 $bright_value;
}

function init {
  gpio -g mode 18 pwm;
}

init;

i="0";
while [ $i -lt 6 ]
do
set_brightness;
sleep 10;
i=$[$i+1];
done