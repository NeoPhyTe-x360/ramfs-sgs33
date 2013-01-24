#!/sbin/busybox sh
##### Undervolting script ##### 

sleep 4
if [ -e /data/.hydrx/nouv ]; 
then
	##### GPU UV #####
	echo "800000 825000 875000 950000" > /sys/class/misc/gpu_voltage_control/gpu_control
	##### BUS UV #####
	echo "775000 825000 850000 850000 925000 925000" > /sys/devices/system/cpu/busfreq/int_volt_table
	echo "825000 825000 825000 875000 875000 900000" > /sys/devices/system/cpu/busfreq/mif_volt_table
	##### CPU UV #####
	echo "1400000 1387500 1237500 1212500 1062500 1062500 1012500 962500 912500 912500 887500 887500 862500 862500 825000 825000" > /sys/devices/system/cpu/cpu0/cpufreq/UV_uV_table
fi
