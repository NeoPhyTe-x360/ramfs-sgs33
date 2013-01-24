#!/sbin/busybox sh
#
##### Drop caches awake on the fly if memory goes below 10mb by NeoPhyTe-x360 ##### 

/sbin/busybox renice 19 `pidof dropcachesawake.sh`
DROP_ONE="1"
DROP_TWO="2"
DROP_THREE="3"
FREE=`free -m | grep -i mem | awk '{print $4}'`  

if [ $FREE -lt 10240 ]; then
	sleep 3
	echo $DROP_ONE > /proc/sys/vm/drop_caches
	echo $DROP_TWO > /proc/sys/vm/drop_caches
	echo $DROP_THREE > /proc/sys/vm/drop_caches
	sync; echo $DROP_THREE > /proc/sys/vm/drop_caches
fi



