#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9789440 378e653a9c3e071636c460fdd912aabbbf5b1ebf 7346176 f51e9b10a5732a1d274feeb450c3f06c46d14c40
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9789440:378e653a9c3e071636c460fdd912aabbbf5b1ebf; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:7346176:f51e9b10a5732a1d274feeb450c3f06c46d14c40 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 378e653a9c3e071636c460fdd912aabbbf5b1ebf 9789440 f51e9b10a5732a1d274feeb450c3f06c46d14c40:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
