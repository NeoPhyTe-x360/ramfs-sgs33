#!/sbin/busybox sh
#
##### renice music and radio on screen off by NeoPhyTe-x360 ##### 

/sbin/busybox renice 19 `pidof musicprioff.sh`
/sbin/busybox renice -6 `pidof com.google.android.music`
/sbin/busybox renice -6 `pidof com.google.android.music:main`
/sbin/busybox renice -6 `pidof com.google.android.music:ui`
/sbin/busybox renice -6 `pidof com.sec.android.app.fm`
/sbin/busybox renice -6 `pidof com.sec.android.app.music`
/sbin/busybox renice -6 `pidof com.sec.android.app.music:service`
