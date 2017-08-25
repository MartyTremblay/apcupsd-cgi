# apcupsd
Docker - APC UPS Power Management Daemon. Typical usage would be to integrate with Home Assistant or openhab

## Building
Build via:
```
docker build -t retrohunter/apcupsd-cgi:latest .
```

## Running
Run via:
```
docker run --device=/dev/usb/hiddev0 retrohunter/apcupsd-cgi:latest
```

Where `--device=/dev/usbhiddev0` is the USB port connected to your UPS. Some sites suggest this may be `/dev/ttyUSB0` on older Linux kernels.

This may vary on some systems, try `lsusb` to see a list of devices.

If you want to verify this look at:

```
udevadm info --name=/dev/usb/hiddev0 --attribute-walk
```

If you cannot access port **80** you may need to use docker's host networking like:
```
docker run -ti --rm --net=host --device=/dev/usb/hiddev0 retrohunter/apcupsd-cgi:latest
```

## Using
Simply point your web browser to port **80** whereever docker is running. eg:

[http://localhost:80/cgi-bin/upsstats.cgi](http://localhost:80/cgi-bin/upsstats.cgi)

or

[http://localhost:80/cgi-bin/multimon.cgi](http://localhost:80/cgi-bin/multimon.cgi)

## Extra information
Check out the apcupsd page here: [www.apcupsd.org](www.apcupsd.org)
