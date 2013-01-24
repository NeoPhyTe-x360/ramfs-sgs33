#!/sbin/busybox sh
#
# wifi state by by NeoPhyTe-x360


/sbin/busybox renice 19 `pidof wifioff.sh`

IWCONFIG=/sbin/iwconfig
INTERFACE=wlan0
WIFI=`iwconfig wlan0 | grep -i mode | awk '{print $1}'`  
OFF=`iwconfig wlan0 | grep -i IEEE | awk '{print $4}'`

/sbin/busybox killall -9 wifion.sh
killall -9 sleep 10
killall -9 sleep 90
killall -9 sleep 3
killall -9 sleep 5

while [ 1 ]; do

if [ ! $OFF = "ESSID:off/any" ]; then
		$IWCONFIG $INTERFACE frag 2345
		$IWCONFIG $INTERFACE rts 2346
		$IWCONFIG $INTERFACE txpower 8dBm
		/sbin/busybox killall -9 wifioff.sh
	else
		sleep 180
		if [ $OFF = "ESSID:off/any" ]; then
			svc wifi disable
		else
			$IWCONFIG $INTERFACE frag 2345
			$IWCONFIG $INTERFACE rts 2346
			$IWCONFIG $INTERFACE txpower 8dBm
		fi
fi
sleep 300
done
