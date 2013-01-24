#!/sbin/busybox sh
#
##### Drop caches sleep on the fly by NeoPhyTe-x360 ##### 

/sbin/busybox renice 19 `pidof dropcachesleep.sh`
echo "2853,5166,12288,21920,38678,73216" > /sys/module/lowmemorykiller/parameters/minfree

DROP_ONE="1"
DROP_TWO="2"
DROP_THREE="3"

echo $DROP_ONE > /proc/sys/vm/drop_caches
echo $DROP_TWO > /proc/sys/vm/drop_caches
echo $DROP_THREE > /proc/sys/vm/drop_caches
sync; echo $DROP_THREE > /proc/sys/vm/drop_caches





