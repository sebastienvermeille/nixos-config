#!/usr/bin/env bash

systemctl stop ModemManager

mbimcli --device-open-proxy --device="/dev/wwan0mbim0" --quectel-set-radio-state=on

systemctl restart ModemManager
