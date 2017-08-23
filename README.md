# apcupsd
Docker - APC UPS Power Management Daemon. Typical usage would be to integrate with Home Assistant or openhab

Build via:
docker build -t retrohunter/apcupsd-cgi:latest .

Run via:
docker run --device=/dev/usb/hiddev0 retrohunter/apcupsd-cgi:latest

Where "--device=/dev/usbhiddev0" is the USB port connected to your UPS. Some sites suggest this may be /dev/ttyUSB0 on older Linux kernels.

This may vary on some systems, use:
$ lsusb

If you want to verify this look at:
$ udevadm info --name=/dev/usb/hiddev0 --attribute-walk

If you cannot access port 80 you may need to use docker's host networking like:
docker run -ti --rm --net=host --device=/dev/usb/hiddev0 retrohunter/apcupsd-cgi:latest
