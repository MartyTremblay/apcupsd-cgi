# APC UPS Power Management
FROM phusion/baseimage

# update
RUN apt-get -y update
 
# install
RUN apt-get -y install apcupsd apcupsd-cgi apache2

# Add apache configuration for CGI front-end
ADD serve-cgi-bin.conf /etc/apache2/conf-enabled/serve-cgi-bin.conf

ADD startup.sh /

# Add symlinks to enable cgi & cleanup
RUN a2enmod cgi \
 && apt-get clean

# Expose Ports 3551 for NIS and 80 for http UI
EXPOSE 3551 80

CMD /startup.sh;
