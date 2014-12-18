#!/system/bin/sh

if [ ! -f /system/etc/.installed_su_daemon ]; then
  /system/bin/mount -rw -o remount /system
  
  /system/bin/chown 0.0 /system/xbin/su
  /system/bin/chown 0.0 /system/xbin/daemonsu
  /system/bin/chown 0.0 /system/xbin/sugote
  /system/bin/chown 0.0 /system/xbin/sugote-mksh
  /system/bin/chown 0.0 /system/xbin/supolicy
  /system/bin/toolbox chcon u:object_r:zygote_exec:s0 /system/xbin/sugote

  /system/xbin/su --install
  echo 1 > /system/etc/.installed_su_daemon
                
  /system/bin/mount -r -o remount /system
fi
                  
/system/xbin/daemonsu --auto-daemon &
