#!/sbin/busybox sh
# thanks to hardcore, nexxx, knzo, gokhanmoral, pikachu01 and simone201
# modded by NeoPhyTe.x360 for HydRx-D GT-i9300



##### IPv6 privacy tweak #####
echo "2" > /proc/sys/net/ipv6/conf/all/use_tempaddr


##### Installing tools and wireless settings #####
mount -o remount,rw,noatime /system
/sbin/busybox mount -t rootfs -o remount,rw rootfs
rm /system/etc/dhcpcd/dhcpcd-hooks/95-configured
/sbin/busybox cp /sbin/95-configured /system/etc/dhcpcd/dhcpcd-hooks/95-configured
chown 0.0 /system/etc/dhcpcd/dhcpcd-hooks/95-configured
chmod 6755 /system/etc/dhcpcd/dhcpcd-hooks/95-configured
rm /system/xbin/sqlite3
/sbin/busybox cp /sbin/sqlite3 /system/xbin/sqlite3
chown 0.0 /system/xbin/sqlite3
chmod 6755 /system/xbin/sqlite3
rm /system/lib/libncurses.so
/sbin/busybox cp /sbin/libncurses.so /system/lib/libncurses.so
chown 0.0 /system/lib/libncurses.so
chmod 6755 /system/lib/libncurses.so
chown 0.0 /system/bin/simproving
chmod 6755 /system/bin/simproving
mount -t rootfs -o remount,ro rootfs


##### Installing Superuser if not exists #####
/sbin/ext/superuser.sh &


##### Governor and VM Tweaks #####
echo "hydrxq" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "1500000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# echo "17" > /sys/devices/system/cpu/cpufreq/hydrxq/screen_off_min_step
echo "30000" > /sys/devices/system/cpu/cpufreq/pegasusq/sampling_rate
echo "110" > /proc/sys/vm/vfs_cache_pressure
echo "40" > /proc/sys/vm/dirty_ratio
echo "10" > /proc/sys/vm/dirty_background_ratio
echo "1536" > /proc/sys/vm/min_free_kbytes
echo "0" > /proc/sys/vm/swappiness
echo "0" > /proc/sys/kernel/randomize_va_space
echo "2853,5166,12288,21920,38678,73216" > /sys/module/lowmemorykiller/parameters/minfree


##### CFS Scheduler Tweaks #####
umount /sys/kernel/debug
mount -t debugfs none /sys/kernel/debug
echo NO_GENTLE_FAIR_SLEEPERS > /sys/kernel/debug/sched_features
echo NO_START_DEBIT > /sys/kernel/debug/sched_features
echo NO_WAKEUP_PREEMPT > /sys/kernel/debug/sched_features
echo NEXT_BUDDY > /sys/kernel/debug/sched_features
echo ARCH_POWER > /sys/kernel/debug/sched_features
echo SYNC_WAKEUPS > /sys/kernel/debug/sched_features
echo HRTICK > /sys/kernel/debug/sched_features
umount /sys/kernel/debug
mount -t debugfs none /sys/kernel/debug



##### mDNIe sharpness tweaks by hardcore script'ed #####
echo 8 88 > /sys/class/misc/mdnie/tune_dynamic_gallery
echo 8 88 > /sys/class/misc/mdnie/tune_dynamic_ui
echo 8 88 > /sys/class/misc/mdnie/tune_dynamic_video
echo 8 8a > /sys/class/misc/mdnie/tune_dynamic_vtcall
echo 8 aa > /sys/class/misc/mdnie/tune_movie_vtcall
echo 8 88 > /sys/class/misc/mdnie/tune_standard_gallery
echo 8 88 > /sys/class/misc/mdnie/tune_standard_ui
echo 8 88 > /sys/class/misc/mdnie/tune_standard_video
echo 8 8a > /sys/class/misc/mdnie/tune_standard_vtcall
echo 8 a8 > /sys/class/misc/mdnie/tune_natural_gallery
echo 8 a8 > /sys/class/misc/mdnie/tune_natural_ui
echo 8 a8 > /sys/class/misc/mdnie/tune_natural_video
echo 8 aa > /sys/class/misc/mdnie/tune_natural_vtcall
echo 8 8 > /sys/class/misc/mdnie/tune_camera
echo 8 408 > /sys/class/misc/mdnie/tune_camera_outdoor
echo 8 e8 > /sys/class/misc/mdnie/tune_cold
echo 8 4e8 > /sys/class/misc/mdnie/tune_cold_outdoor
echo 8 4a8 > /sys/class/misc/mdnie/tune_outdoor
echo 8 e8 > /sys/class/misc/mdnie/tune_warm
echo 8 4e8 > /sys/class/misc/mdnie/tune_warm_outdoor

for i in `ls -1 /sys/class/misc/mdnie`;do
echo 92 0 > /sys/class/misc/mdnie/$i
echo 93 0 > /sys/class/misc/mdnie/$i
echo 94 0 > /sys/class/misc/mdnie/$i
echo 95 0 > /sys/class/misc/mdnie/$i
echo 96 0 > /sys/class/misc/mdnie/$i
echo 97 0 > /sys/class/misc/mdnie/$i
echo 98 0 > /sys/class/misc/mdnie/$i
echo 99 0 > /sys/class/misc/mdnie/$i
done;


 
##### SD cards (mmcblk) read ahead tweaks #####
echo "512" > /sys/devices/virtual/bdi/179:0/read_ahead_kb
echo "512" > /sys/devices/virtual/bdi/179:16/read_ahead_kb
echo "256" > /sys/devices/virtual/bdi/default/read_ahead_kb


##### TCP tweaks #####
  echo "0" > /proc/sys/net/ipv4/tcp_timestamps;
  echo "1" > /proc/sys/net/ipv4/tcp_tw_reuse;
  echo "1" > /proc/sys/net/ipv4/tcp_sack;
  echo "1" > /proc/sys/net/ipv4/tcp_tw_recycle;
  echo "1" > /proc/sys/net/ipv4/tcp_window_scaling;
  echo "2" > /proc/sys/net/ipv4/tcp_syn_retries;
  echo "2" > /proc/sys/net/ipv4/tcp_synack_retries;
  echo "10" > /proc/sys/net/ipv4/tcp_fin_timeout;
  echo "404480" > /proc/sys/net/core/wmem_max;
  echo "404480" > /proc/sys/net/core/rmem_max;
  echo "256960" > /proc/sys/net/core/rmem_default;
  echo "256960" > /proc/sys/net/core/wmem_default;
  echo "4096 16384 404480" > /proc/sys/net/ipv4/tcp_wmem;
  echo "4096 87380 404480" > /proc/sys/net/ipv4/tcp_rmem;



##### 3G-2G and wifi network battery tweaks #####
setprop ro.ril.enable.a52 0
setprop ro.ril.enable.a53 1
setprop ro.ril.fast.dormancy.timeout 3
setprop ro.ril.enable.sbm.feature 1
setprop ro.ril.enable.sdr 0
setprop ro.ril.qos.maxpdps 2
setprop ro.ril.hsxpa 2
setprop ro.ril.hsdpa.category 14
setprop ro.ril.hsupa.category 7
setprop ro.ril.hep 1
setprop ro.ril.enable.dtm 0
setprop ro.ril.enable.amr.wideband 1
setprop ro.ril.gprsclass 12
setprop ro.ril.avoid.pdp.overlap 1
setprop ro.ril.enable.prl.recognition 0
setprop ro.ril.def.agps.mode 2
setprop ro.ril.enable.managed.roaming 1
setprop ro.ril.enable.enhance.search 0
setprop ro.ril.fast.dormancy.rule 1
setprop ro.ril.fd.scron.timeout 30
setprop ro.ril.fd.scroff.timeout 10
setprop ro.ril.emc.mode 2
setprop ro.ril.att.feature 0
setprop wifi.supplicant_scan_interval 200
setprop pm.sleep_mode 1
setprop ro.ril.disable.power.collapse 1


##### Tweaks for multitasking - values I consider the minimum - neophyte-x360 #####
setprop dalvik.vm.heapstartsize 6m
setprop dalvik.vm.heapgrowthlimit 48m
setprop dalvik.vm.heapsize 148m


##### Some hw tweaks more #####
setprop video.accelerate.hw 1
setprop persist.sys.use_dithering 0
setprop debug.egl.profiler 1
setprop debug.egl.hw 1
setprop debug.composition.type gpu
setprop persist.sys.ui.hw 1
setprop debug.sf.hw 1
setprop windowsmgr.max_events_per_sec 130


##### Home app in memory all the time #####
setprop ro.HOME_APP_ADJ -17


##### New scheduler tweaks + readahead tweaks #####
MMC=`ls -d /sys/block/mmc*`;
ZRM=`ls -d /sys/block/zram*`;

for i in $MMC $ZRM;
do
	echo "sio" > $i/queue/scheduler;
	echo "0" > $i/queue/iostats;
	if [ -e $i/queue/rotational ]; 
	then
		echo "0" > $i/queue/rotational; 
	fi;
	if [ -e $i/queue/add_random ]; 
	then
		echo "0" > $i/queue/add_random; 
	fi;
	if [ -e $i/queue/iosched/low_latency ]; 
	then
		echo "1" > $i/queue/iosched/low_latency; 
	fi;
	if [ -e $i/queue/nr_requests ];
	then
		echo "8192" > $i/queue/nr_requests;
	fi;
done;



##### Turn off debugging for certain modules #####
  echo "0" > /sys/module/wakelock/parameters/debug_mask
  echo "0" > /sys/module/userwakelock/parameters/debug_mask
  echo "0" > /sys/module/earlysuspend/parameters/debug_mask
  echo "0" > /sys/module/alarm/parameters/debug_mask
  echo "0" > /sys/module/alarm_dev/parameters/debug_mask
  echo "0" > /sys/module/binder/parameters/debug_mask



##### Doing some cleanup before init.d support & neak options #####
    /sbin/busybox sh /sbin/ext/cleanup.sh



##### Voodoo enable and settings - and enable eargasm by default #####
echo "56" > /sys/class/misc/scoobydoo_sound/headphone_amplifier_level
echo "1" > /sys/class/misc/scoobydoo_sound/stereo_expansion
echo "16" > /sys/class/misc/scoobydoo_sound/stereo_expansion_gain
echo "1" > /sys/class/misc/scoobydoo_sound/headphone_eq
echo "6" > /sys/class/misc/scoobydoo_sound/headphone_eq_b1_gain
echo "4" > /sys/class/misc/scoobydoo_sound/headphone_eq_b2_gain
echo "1" > /sys/class/misc/scoobydoo_sound/headphone_eq_b3_gain
echo "-1" > /sys/class/misc/scoobydoo_sound/headphone_eq_b4_gain
echo "1" > /sys/class/misc/scoobydoo_sound/headphone_eq_b5_gain


##### Script to initiate rngd at boot thx to Ryuinferno ##### 
/sbin/rngd -B 64 -t 2 -T 1 -s 16 --fill-watermark=65%
sleep 2
echo "-15" > /proc/$(pgrep rngd)/oom_adj
/sbin/busybox renice 0 `pidof rngd`



##### Creating file for UV #####
/sbin/busybox mkdir /data/.hydrx
/sbin/busybox cp /sbin/nouv /data/.hydrx/nouv


##### Stweaks compatible #####
   /sbin/ext/stweaks &

##### Early-init phase tweaks #####
   /sbin/ext/scaling.sh &
   /system/bin/simproving &
   /system/bin/simproving2 &
   /system/bin/simproving3 &
   /sbin/ext/dropcacheswap.sh &
   /sbin/busybox renice 19 `pidof dropcacheswap.sh`
   /sbin/ext/flyiosched.sh &
   /sbin/busybox renice 19 `pidof flyiosched.sh`
   /sbin/ext/smoothsystem.sh &
   /sbin/busybox renice 19 `pidof smoothsystem.sh`
   /sbin/ext/undervolt.sh &
   /sbin/ext/killing &


##### EFS Backup #####
(
sleep 25
/sbin/busybox sh /sbin/ext/efs-backup.sh
) &



##### Mount system as rw and noatime #####
/sbin/busybox mount -t rootfs -o remount,ro rootfs
/sbin/busybox mount -o remount,noatime /system




##### Optimize SQlite databases of apps ##### 
for i in \
`busybox find /data -iname "*.db"`; 
do \
	/sbin/sqlite3 $i 'VACUUM;';
	/sbin/sqlite3 $i 'REINDEX;';
done;
if [ -d "/dbdata" ]; then
	for i in \
	`busybox find /dbdata -iname "*.db"`; 
	do \
		/sbin/sqlite3 $i 'VACUUM;';
		/sbin/sqlite3 $i 'REINDEX;';
	done;
fi;
if [ -d "/datadata" ]; then
	for i in \
	`busybox find /datadata -iname "*.db"`; 
	do \
		/sbin/sqlite3 $i 'VACUUM;';
		/sbin/sqlite3 $i 'REINDEX;';
	done;
fi;
for i in \
`busybox find /sdcard -iname "*.db"`; 
do \
	/sbin/sqlite3 $i 'VACUUM;';
	/sbin/sqlite3 $i 'REINDEX;';
done;



##### init.d support #####
if cd /system/etc/init.d >/dev/null 2>&1 ; then
    for file in * ; do
        if ! ls "$file" >/dev/null 2>&1 ; then continue ; fi
        echo "START '$file'"
        /system/bin/sh "$file"
        echo "EXIT '$file' ($?)"
    done
fi


if cd /data/init.d >/dev/null 2>&1 ; then
    for file in * ; do
        if ! ls "$file" >/dev/null 2>&1 ; then continue ; fi
        echo "START '$file'"
        /system/bin/sh "$file"
        echo "EXIT '$file' ($?)"
    done
fi


