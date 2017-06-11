#!/bin/bash

sed -i "s/UPSCABLE smart/UPSCABLE usb/g" /etc/apcupsd/apcupsd.conf
sed -i "s/NISIP 127.0.0.1/NISIP 0.0.0.0/g" /etc/apcupsd/apcupsd.conf
sed -i "s/UPSTYPE apcsmart/UPSTYPE usb/g" /etc/apcupsd/apcupsd.conf
sed -i "s/DEVICE \/dev\/ttyS0/DEVICE/g" /etc/apcupsd/apcupsd.conf
sed -i "s/ISCONFIGURED=no/ISCONFIGURED=yes/g" /etc/default/apcupsd

apcupsd -b;
