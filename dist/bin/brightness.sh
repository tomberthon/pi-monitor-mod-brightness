#!/bin/bash

function set_brightness {
  echo "Redis: $DB_PORT_6379_TCP_ADDR $DB_PORT_6379_TCP_PORT";
  bright_value=$(/opt/train-alerts/libs/redi.sh/redi.sh -g mod-brightness);
  
  echo "Brightness: $bright_value";
  gpio -g pwm 18 $bright_value;
}

function init {
  echo "gpio init";
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