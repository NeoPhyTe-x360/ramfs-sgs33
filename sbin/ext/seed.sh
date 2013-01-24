#!/sbin/busybox sh
#
##### Enable seed in awake mode by NeoPhyTe-x360 ##### 

/sbin/busybox renice 19 `pidof seed.sh`
killall -9 rngd
sleep 1
/sbin/rngd -B 64 -t 2 -T 1 -s 16 --fill-watermark=65%
sleep 2
echo "-15" > /proc/$(pgrep rngd)/oom_adj
/sbin/busybox renice 0 `pidof rngd`





