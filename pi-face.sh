#!/bin/bash -ex


##########CONFIGURE############
#Set full path to install directory
target=/opt #absolute path to directory that will be the parent of mjpg-streamer/
port=8080 #must be above 1024
YUV="false" #change to true if you have a camera incapable of producing mjpeg (leave quotes)
websource="http://www.bobtech.ro/get?download=36:mjpg-streamer-rpi"
###############################

#Check for Root

LUID=$(id -u)
if [[ $LUID -ne 0 ]]; then
	echo "$0 must be run as root"
	exit 1
fi

#Repo Install Function

install ()
{
	apt-get update
	DEBIAN_FRONTEND=noninteractive apt-get -y \
        -o DPkg::Options::=--force-confdef \
        -o DPkg::Options::=--force-confold \
        install $@
}

install libv4l-0 v4l-utils

#Get and Rename compiled program from websource

wget -O /tmp/MJPG-streamer-rpi.tar.gz $websource

#Untar and decompress to target (specified above)

tar xvzf MJPG-streamer-rpi.tar.gz --directory $target

#set port in mjpg-streamer.sh

sed -i "s|PORT=8080|PORT=$port|" $target/mjpg-streamer/mjpg-streamer.sh

#Set YUV value

sed -i "s|YUV="false"|YUV=$YUV|" $target/mjpg-streamer/mjpg-streamer.sh

