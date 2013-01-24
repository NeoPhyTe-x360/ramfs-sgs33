#!/sbin/busybox sh
#
##### Drop caches on the fly if memory goes below 8mb by NeoPhyTe-x360 ##### 

DROP_ONE="1"
DROP_TWO="2"
DROP_THREE="3"

while [ 1 ];
do
	FREE=`free -m | grep -i mem | awk '{print $4}'`  
	if [ $FREE -lt 8192 ]; then
		echo $DROP_ONE > /proc/sys/vm/drop_caches
		echo $DROP_TWO > /proc/sys/vm/drop_caches
		echo $DROP_THREE > /proc/sys/vm/drop_caches
		sync; echo $DROP_THREE > /proc/sys/vm/drop_caches
	fi
	sleep 3600
done



