#!/sbin/busybox sh
if [ ! -f /data/.hydrx/efsbackup.tar.gz ];
then
  mkdir /data/.hydrx
  chmod 777 /data/.hydrx
  /sbin/busybox tar zcvf /data/.hydrx/efsbackup.tar.gz /efs
  /sbin/busybox cat /dev/block/mmcblk0p3 > /data/.hydrx/efsdev-mmcblk0p3.img
  /sbin/busybox gzip /data/.hydrx/efsdev-mmcblk0p3.img
  #make sure that sdcard is mounted, media scanned..etc
  (
    sleep 500
    /sbin/busybox mkdir /sdcard/.hydrx
    /sbin/busybox cp /data/.hydrx/efs* /sdcard/.hydrx-efs
  ) &
fi

