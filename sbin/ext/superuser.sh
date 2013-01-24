#!/sbin/busybox sh

if [ -s /system/xbin/su ];
  then
    echo "Superuser already exists"
  else
    mount -o remount,rw /system
    rm -f /system/bin/su
    rm -f /system/xbin/su
    mkdir /system/xbin
    chmod 755 /system/xbin
    cp /res/misc/esu /system/xbin/su
    chown 0.0 /system/xbin/su
    chmod 6755 /system/xbin/su

    rm -f /system/app/*uper?ser.apk
    rm -f /data/app/*uper?ser.apk
    rm -rf /data/dalvik-cache/*uper?ser.apk*
    xzcat /res/misc/Superuser.apk.xz > /system/app/Superuser.apk
    chown 0.0 /system/app/Superuser.apk
    chmod 644 /system/app/Superuser.apk
fi

