#!/sbin/busybox sh
#
##### Iosched on the fly to get some extra performance by NeoPhyTe-x360 ##### 

busybox renice 19 `pidof flyiosched2.sh`;
killall -9 sleep 1
sleep 3
MMC=`ls -d /sys/block/mmc*`;

for i in $MMC; do
	echo "deadline" > $i/queue/scheduler
	sleep 5
	echo "sio" > $i/queue/scheduler
done;




