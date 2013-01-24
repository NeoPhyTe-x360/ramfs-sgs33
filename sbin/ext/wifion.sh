#!/sbin/busybox sh
#
# wifi state by by NeoPhyTe-x360


/sbin/busybox renice 19 `pidof wifion.sh`
IWCONFIG=/sbin/iwconfig
INTERFACE=wlan0
WIFI=`iwconfig wlan0 | grep -i mode | awk '{print $1}'`
OFF=`iwconfig wlan0 | grep -i IEEE | awk '{print $4}'`

killall -9 wifioff.sh
killall -9 sleep 300
killall -9 sleep 180

# svc wifi enable
# sleep 1
$IWCONFIG $INTERFACE txpower 11dBm
sleep 10
if [ ! $OFF = "ESSID:off/any" ]; then
		$IWCONFIG $INTERFACE frag 2345
		$IWCONFIG $INTERFACE rts 2346
		$IWCONFIG $INTERFACE txpower 11dBm
		/sbin/busybox killall -9 wifion.sh
	else
		sleep 90
		if [ $OFF = "ESSID:off/any" ]; then
			svc wifi disable
			/sbin/busybox killall -9 wifion.sh
		else
			$IWCONFIG $INTERFACE frag 2345
			$IWCONFIG $INTERFACE rts 2346
			$IWCONFIG $INTERFACE txpower 11dBm
		fi
fi
