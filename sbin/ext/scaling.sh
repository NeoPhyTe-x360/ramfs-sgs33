#!/sbin/busybox sh
#
# Screenstate_Scaling - switch CPU frequency governor on screen state change original by florian.schaefer@gmail.com (FloHimself)
# Modded Script Options by NeoPhyTe.x360 based ROMS

sleep 47
echo "2853,5166,12288,21920,38678,73216" > /sys/module/lowmemorykiller/parameters/minfree

AWAKE_UP_THRESHOLD="70"
AWAKE_UP_THRESHOLD_AT_MIN="55"

SLEEP_UP_THRESHOLD="95"
SLEEP_UP_THRESHOLD_AT_MIN="70"

AWAKE_PUMP_UP="2"
SLEEP_PUMP_UP="1"

DROP_CACHES="3"

AWAKE_SWAPPINESS="2"
SLEEP_SWAPPINESS="20"

AWAKE_LAPTOP_MODE="0"
SLEEP_LAPTOP_MODE="5"

AWAKE_DIRTY_RATIO="50"
SLEEP_DIRTY_RATIO="5"

AWAKE_DIRTY_BACKGROUND_RATIO="10"
SLEEP_DIRTY_BACKGROUND_RATIO="5"

AWAKE_VFS_CACHE_PRESSURE="110"
SLEEP_VFS_CACHE_PRESSURE="60"


IWCONFIG=/sbin/iwconfig


(while [ 1 ];
do
    AWAKE=`cat /sys/power/wait_for_fb_wake`;
    if [ $AWAKE = "awake" ]; then
	sleep 2;
	echo $AWAKE_UP_THRESHOLD_AT_MIN > /sys/devices/system/cpu/cpufreq/hydrxq/dec_cpu_load;
	echo $AWAKE_UP_THRESHOLD > /sys/devices/system/cpu/cpufreq/hydrxq/inc_cpu_load;
	echo $AWAKE_PUMP_UP > /sys/devices/system/cpu/cpufreq/hydrxq/pump_up_step;
	echo $AWAKE_DIRTY_RATIO > /proc/sys/vm/dirty_ratio;
	echo $AWAKE_DIRTY_BACKGROUND_RATIO > /proc/sys/vm/dirty_background_ratio;
	echo $AWAKE_VFS_CACHE_PRESSURE > /proc/sys/vm/vfs_cache_pressure;
	echo $AWAKE_LAPTOP_MODE > /proc/sys/vm/laptop_mode;
	(/sbin/ext/wifion.sh &);
	busybox renice 0 `pidof scaling.sh`;
	(/sbin/ext/flyiosched2.sh &);
	(/sbin/ext/dropcashesawake.sh &);
	(/sbin/ext/ramcheck.sh &);
	(/sbin/ext/seed.sh &);
	(/sbin/ext/musicprion.sh &);
	sleep 2
	AWAKE=;
    fi;
    SLEEPING=`cat /sys/power/wait_for_fb_sleep`;
    if [ $SLEEPING = "sleeping" ]; then
	sleep 3;
	echo $SLEEP_DIRTY_RATIO > /proc/sys/vm/dirty_ratio;
	echo $SLEEP_DIRTY_BACKGROUND_RATIO > /proc/sys/vm/dirty_background_ratio;
	echo $SLEEP_VFS_CACHE_PRESSURE > /proc/sys/vm/vfs_cache_pressure;
	echo $SLEEP_UP_THRESHOLD > /sys/devices/system/cpu/cpufreq/hydrxq/inc_cpu_load;
	echo $SLEEP_UP_THRESHOLD_AT_MIN > /sys/devices/system/cpu/cpufreq/hydrxq/dec_cpu_load;
	echo $SLEEP_PUMP_UP > /sys/devices/system/cpu/cpufreq/hydrxq/pump_up_step;
	(killall -9 flyiosched2.sh);
	(killall -9 ramcheck.sh);
	(/sbin/ext/wifioff.sh &);
	echo $SLEEP_LAPTOP_MODE > /proc/sys/vm/laptop_mode;
	(/sbin/ext/dropcashesleep.sh &);
	(/sbin/ext/musicprioff.sh &);
	(killall -9 rngd);
	sleep 2
        SLEEPING=;
     fi;
done &);
