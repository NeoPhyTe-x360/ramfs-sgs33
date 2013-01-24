#!/sbin/busybox sh
#
# Unused tweaks by NeoPhyTe-x360

rm /system/xbin/sqlite3
rm /system/xbin/iwconfig
rm /system/bin/tune2fs
# rm /system/bin/tune2fs_recvy
rm /system/bin/e2fsck1
# rm /system/bin/e2fsck_recvy
/sbin/busybox cp /sbin/sqlite3 /system/xbin/sqlite3
/sbin/busybox cp /sbin/iwconfig /system/xbin/iwconfig
/sbin/busybox cp /sbin/tune2fs /system/bin/tune2fs
# /sbin/busybox cp /sbin/tune2fs_recvy /system/bin/tune2fs_recvy
/sbin/busybox cp /sbin/e2fsck1 /system/bin/e2fsck1
# /sbin/busybox cp /sbin/e2fsck_recvy /system/bin/e2fsck_recvy
chown 0.0 /system/xbin/sqlite3
chmod 6755 /system/xbin/sqlite3
chown 0.0 /system/xbin/iwconfig
chmod 6755 /system/xbin/iwconfig
chown 0.0 /system/bin/tune2fs
chmod 6755 /system/bin/tune2fs
# chown 0.0 /system/bin/tune2fs_recvy
# chmod 6755 /system/bin/tune2fs_recvy
chown 0.0 /system/bin/e2fsck1
chmod 6755 /system/bin/e2fsck1
# chown 0.0 /system/bin/e2fsck_recvy
# chmod 6755 /system/bin/e2fsck_recvy



# Add 128MB swap and disable journaling for more speed
# if [ ! -f /cache/swapfile.swp ]
# then
#	umount /cache
#	/sbin/mkfs.ext4 -b 4096 -m 0 -F -L cache /dev/block/mmcblk0p8
#	/sbin/e2fsck1 -yf /dev/block/mmcblk0p8
#	/sbin/tune2fs -o journal_data_writeback -O ^has_journal /dev/block/mmcblk0p8
#	/sbin/busybox mount -t ext4 -o rw,loop,commit=19,barrier=0,nobh,nouser_xattr,errors=continue,noatime,nodiratime,nodev /dev/block/mmcblk0p8 /cache
#	sleep 1
#	dd if=/dev/zero of=/cache/swapfile.swp bs=1024 count=131072
#	/sbin/mkswap /cache/swapfile.swp >/dev/null
#	/sbin/swapon /cache/swapfile.swp
#	echo "100" > /proc/sys/vm/swappiness
# fi

# if [ -e /cache/swapfile.swp ]
# then
#	/sbin/busybox mount -t ext4 -o remount,rw,loop,commit=19,barrier=0,nobh,nouser_xattr,errors=continue,noatime,nodiratime,nodev /cache
#	/sbin/swapon /cache/swapfile.swp
#	echo "100" > /proc/sys/vm/swappiness
# fi


# umount /system
# sleep 1
# /sbin/e2fsck1 -yf /dev/block/mmcblk0p9
# /sbin/tune2fs -c -1 -i 0 -o journal_data_writeback -O ^has_journal /dev/block/mmcblk0p9
# /sbin/busybox mount -o remount,rw,noatime /system /system

# umount /data
# sleep 1
# /sbin/e2fsck1 -yf /dev/block/mmcblk0p12
# /sbin/tune2fs -c -1 -i 0 -o journal_data_writeback -O ^has_journal /dev/block/mmcblk0p12
# /sbin/busybox mount -o remount,rw,noatime /data /data

# if [ -e /dev/block/zram0 ]; then
	# Setting swappines
#	echo "20" > /proc/sys/vm/swappiness
	# Setting size of each ZRAM swap drives
#	echo "134217728" > /sys/block/zram0/disksize
#	echo "100663296" > /sys/block/zram1/disksize
#	echo "100663296" > /sys/block/zram2/disksize
	# Creating SWAPS from ZRAM drives
#	/sbin/mkswap /dev/block/zram0 >/dev/null
#	/sbin/mkswap /dev/block/zram1 >/dev/null
#	/sbin/mkswap /dev/block/zram2 >/dev/null
	# Activating ZRAM swaps with the same priority to load balance ram swapping (need advanced busybox with swapon -p flag)
#	/sbin/swapon /dev/block/zram0 -p 32000 >/dev/null 2>&1
#	/sbin/swapon /dev/block/zram1 -p 32000 >/dev/null 2>&1
#	/sbin/swapon /dev/block/zram2 -p 32000 >/dev/null 2>&1
#	if [ -e /cache/swapfile.swp ]
#	then
#	/sbin/busybox mount -t ext4 -o remount,rw,loop,commit=19,barrier=0,nobh,nouser_xattr,errors=continue,noatime,nodiratime,nodev /cache
#	/sbin/swapon /cache/swapfile.swp -p 8000 >/dev/null 2>&1
#	fi
# fi



# /sbin/tune2fs -o journal_data_writeback /dev/block/mmcblk0p8
# /sbin/tune2fs -o journal_data_writeback /dev/block/mmcblk0p9
# /sbin/tune2fs -o journal_data_writeback /dev/block/mmcblk0p12



# Pegasus CPU hotplug tweaks - thx to hardcore
# echo "500000" > /sys/devices/system/cpu/cpufreq/complexdreams/hotplug_freq_1_1
# echo "800000" > /sys/devices/system/cpu/cpufreq/complexdreams/hotplug_freq_2_1
# echo "800000" > /sys/devices/system/cpu/cpufreq/complexdreams/hotplug_freq_3_1
# echo "200000" > /sys/devices/system/cpu/cpufreq/complexdreams/hotplug_freq_2_0
# echo "500000" > /sys/devices/system/cpu/cpufreq/complexdreams/hotplug_freq_3_0
# echo "500000" > /sys/devices/system/cpu/cpufreq/complexdreams/hotplug_freq_4_0

# echo "100" > /sys/devices/system/cpu/cpufreq/complexdreams/hotplug_rq_1_1
# echo "100" > /sys/devices/system/cpu/cpufreq/complexdreams/hotplug_rq_2_0
# echo "200" > /sys/devices/system/cpu/cpufreq/complexdreams/hotplug_rq_2_1
# echo "200" > /sys/devices/system/cpu/cpufreq/complexdreams/hotplug_rq_3_0
# echo "300" > /sys/devices/system/cpu/cpufreq/complexdreams/hotplug_rq_3_1
# echo "300" > /sys/devices/system/cpu/cpufreq/complexdreams/hotplug_rq_4_0
# echo "30000" > /sys/devices/system/cpu/cpufreq/complexdreams/sampling_rate




# echo "2853,5166,12288,17920,38678,73216" > /sys/module/lowmemorykiller/parameters/minfree
# echo "2000000" > /proc/sys/kernel/sched_latency_ns
# echo "100000" > /proc/sys/kernel/sched_min_granularity_ns
# echo "70000" > /proc/sys/kernel/sched_wakeup_granularity_ns
# echo "-16" > /proc/1/oom_adj
# echo "1" > /proc/sys/vm/oom_kill_allocating_task



# Remount all partitions with noatime
#  for k in $(/sbin/busybox mount | /sbin/busybox grep relatime | /sbin/busybox cut -d " " -f3)
#  do
#        sync
#        /sbin/busybox mount -o remount,noatime $k
#  done

# Remount ext4 partitions with optimizations
#  for k in $(/sbin/busybox mount | /sbin/busybox grep ext4 | /sbin/busybox cut -d " " -f3)
#  do
#        sync
#        /sbin/busybox mount -o remount,commit=15 $k
#  done



# New scheduler tweaks + readahead tweaks (thx to Pikachu01)
MMC=`ls -d /sys/block/mmc*`;
ZRM=`ls -d /sys/block/zram*`;

for i in $MMC $ZRM;
do
	echo "sio" > $i/queue/scheduler;
#	echo "sio" > /sys/block/mmcblk0/queue/scheduler;
#	echo "sio" > /sys/block/mmcblk1/queue/scheduler;
	echo "0" > $i/queue/iostats;
#	echo "2500" > $i/queue/iosched/async_read_expire;
#	echo "250" > $i/queue/iosched/sync_read_expire;
#	echo "5000" > $i/queue/iosched/async_expire;
#	echo "500" > $i/queue/iosched/sync_expire;
#	echo "16" > $i/queue/iosched/fifo_batch;
#	echo "2500" > $i/queue/iosched/async_write_expire;
#	echo "250" > $i/queue/iosched/sync_write_expire;
	if [ -e $i/queue/rotational ]; 
	then
		echo "0" > $i/queue/rotational; 
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



##### Early-init phase tweaks #####
   /sbin/ext/scaling.sh &
   /sbin/ext/dropcacheswap.sh &
   /sbin/busybox renice 19 `pidof dropcacheswap.sh`
   /sbin/ext/flyiosched.sh &
   /sbin/busybox renice 19 `pidof flyiosched.sh`
# /sbin/busybox sh /sbin/ext/tweaks.sh &
   /sbin/ext/smoothsystem.sh &
   /sbin/busybox renice 19 `pidof smoothsystem.sh`
# /sbin/busybox sh /system/bin/simproving &
   /sbin/killing &


/sbin/busybox mount -o remount,noatime /system
# ,rw,loop,noatime,data=writeback,nobh,commit=60,errors=continue,barrier=0 /system
# /sbin/busybox mount -t ext4 -o remount,rw,loop,noatime,data=writeback,nobh,commit=60,errors=continue,barrier=0 /data
# /sbin/busybox mount -t ext4 -o remount,rw,loop,noatime,data=writeback,nobh,commit=60,errors=continue,barrier=0 /cache



sleep 50
(
AWAKE_UP_THRESHOLD="70"
AWAKE_UP_THRESHOLD_AT_MIN="55"

# AWAKE_NR_CPUS="2"
# SLEEP_NR_CPUS="1"

SLEEP_UP_THRESHOLD="95"
SLEEP_UP_THRESHOLD_AT_MIN="60"

# AWAKE_LOAD_H0="5"
# AWAKE_LOAD_L1="2"
# SLEEP_LOAD_H0="25"
# SLEEP_LOAD_L1="15"
# AWAKE_LOAD_RQ="10"
# SLEEP_LOAD_RQ="20"
# AWAKE_MIN_RQ="1"
# SLEEP_MIN_RQ="2"
# AWAKE_RATE="50"
# SLEEP_RATE="200"

DROP_CACHES="3"

AWAKE_SWAPPINESS="2"
SLEEP_SWAPPINESS="20"

AWAKE_LAPTOP_MODE="0"
SLEEP_LAPTOP_MODE="5"

# AWAKE_HZ="hz=80"
# SLEEP_HZ="hz=5"

AWAKE_MAX_FREQ="1400000"
SLEEP_MAX_FREQ="700000"

AWAKE_DIRTY_RATIO="40"
SLEEP_DIRTY_RATIO="5"

AWAKE_DIRTY_BACKGROUND_RATIO="20"
SLEEP_DIRTY_BACKGROUND_RATIO="5"

AWAKE_VFS_CACHE_PRESSURE="110"
SLEEP_VFS_CACHE_PRESSURE="60"

# AWAKE_GPU_FREQ="160 266 350 440" 
# SLEEP_GPU_FREQ="100 100 160 200"
# GPU_VOLTAGE_AWAKE_LOW=825000
# GPU_VOLTAGE_AWAKE_MED=850000
# GPU_VOLTAGE_AWAKE_HIGH=900000
# GPU_VOLTAGE_AWAKE_SUHIGH=975000
# GPU_VOLTAGE_SLEEP_LOW=800000
# GPU_VOLTAGE_SLEEP_MED=800000
# GPU_VOLTAGE_SLEEP_HIGH=825000
# GPU_VOLTAGE_SLEEP_SUHIGH=850000


IWCONFIG=/sbin/iwconfig



while [ 1 ]
do
    AWAKE=`cat /sys/power/wait_for_fb_wake`
    if [ $AWAKE = "awake" ] && [ ! "`pidof $SETCPU`" ]; then
        AWAKE=
	echo $AWAKE_UP_THRESHOLD_AT_MIN > /sys/devices/system/cpu/cpufreq/hydrxq/dec_cpu_load
	echo $AWAKE_UP_THRESHOLD > /sys/devices/system/cpu/cpufreq/hydrxq/inc_cpu_load
	echo $AWAKE_DIRTY_RATIO > /proc/sys/vm/dirty_ratio
	echo $AWAKE_DIRTY_BACKGROUND_RATIO > /proc/sys/vm/dirty_background_ratio
	echo $AWAKE_VFS_CACHE_PRESSURE > /proc/sys/vm/vfs_cache_pressure
	echo $AWAKE_LAPTOP_MODE > /proc/sys/vm/laptop_mode
	$IWCONFIG wlan0 txpower 10dBm
	busybox renice 0 `pidof scaling.sh`
	/sbin/ext/flyiosched2.sh &
	busybox renice 19 `pidof flyiosched2.sh`
	sleep 6
	fi
    SLEEPING=`cat /sys/power/wait_for_fb_sleep`
    if [ $SLEEPING = "sleeping" ] && [ ! "`pidof $SETCPU`" ]; then
        SLEEPING=
	echo $SLEEP_DIRTY_RATIO > /proc/sys/vm/dirty_ratio
	echo $SLEEP_DIRTY_BACKGROUND_RATIO > /proc/sys/vm/dirty_background_ratio
	echo $DROP_CACHES > /proc/sys/vm/drop_caches
	echo $SLEEP_VFS_CACHE_PRESSURE > /proc/sys/vm/vfs_cache_pressure
	echo $SLEEP_UP_THRESHOLD_AT_MIN > /sys/devices/system/cpu/cpufreq/hydrxq/dec_cpu_load
	echo $SLEEP_UP_THRESHOLD > /sys/devices/system/cpu/cpufreq/hydrxq/inc_cpu_load
	busybox renice -10 `pidof scaling.sh`
	$IWCONFIG wlan0 txpower 6dBm
	sync; echo $SLEEP_LAPTOP_MODE > /proc/sys/vm/laptop_mode
	killall -9 flyiosched2.sh
	sleep 6
	fi    
done &
)
