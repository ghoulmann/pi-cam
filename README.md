<html>
<head></head><body>
<i>Scripted by Rik Goldman based on web resources (below), and with integral testing and feedback by Paul and Delonte, high-school students at Chelsea School in Silver Spring, MD. Consider using in conjunction with Zoneminder (scripted for installation on Raspbian at https://github.com/ghoulmann/rpi-zoneminder.</i>
<h2>Objective</h2>
Install and configure streaming web video for Raspberry Pi running Raspbian. Read about it at <a href="http://www.adafruit.com/blog/2012/11/02/pieye-streaming-webcam-piday-raspberrypi-raspberry_pi/">Adafruit</a>.
<h2>Assumptions</h2>
<ul><li>Using a Raspberry Pi
	<li>Running Raspbian "Wheezy"
	<li>Have access to the internet without a proxy
	<li>Access to root privileges
	<li>Have a webcam on /dev/video0
</ul>
<h2>What it Does</h2>
In verbose bashish,
<ol>
	<li>Exit if it's not executed with root privileges
	<li>Updates repo information
	<li>Installs from repos: libv4l-0 and v4l-utils
	<li>Downloads MJPG-streamer-rpi.tar.gz to /tmp/MJPG-streamer-rpi.tar.gz (source can be changed)
	<li>Untar and decompress to directory in /opt (/opt is default, can be changed to suit taste)
	<li>Changes default values for YUV and Port (defaults: YUV="false" and port=8080)
	</ol>

<h2>To Do</h2>
<ul><li>alias in /usr/bin (perhaps)</li>
	<li>option to run as service from init.d</li>
	<li>echo url to stream on start? http://$ipaddr:$port/?action=stream</li>
	<li>detect yuv v mjpeg and configure as appropriate(?)</li>
	<li>Run as root, service for /etc/init.d (fork)
</ul>
<h2>Sources</h2>
Based on links at Adafruit: <a href="http://www.adafruit.com/blog/2012/11/02/pieye-streaming-webcam-piday-raspberrypi-raspberry_pi/">http://www.adafruit.com/blog/2012/11/02/pieye-streaming-webcam-piday-raspberrypi-raspberry_pi"</a>
<h2>Use</h2>
<ol><li>Download directly or use git clone.
	<li>Edit to customize target directory, enable YUV, or change the download source as you see fit: (using nano from the command line) nano /path/to/pi-face.sh
	<li>Run the script as root: sudo /path/to/pi-face.sh
</ol>
</body>