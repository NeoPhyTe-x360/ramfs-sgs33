#!/sbin/busybox sh
#
##### Iosched on the fly to get some extra performance by NeoPhyTe-x360 ##### 

sleep 40
MMC=`ls -d /sys/block/mmc*`;

while [ 1 ]; do
	for i in $MMC; do
		echo "deadline" > $i/queue/scheduler
		sleep 5
		echo "sio" > $i/queue/scheduler
		sleep 1800
	done;
done



