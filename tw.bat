adb.exe kill-server
adb start-server

adb push libgame.so /data/data/com.rekoo.pubgm/lib/libgame.so
adb push libgame.so /data/app/com.rekoo.pubgm-1/lib/arm/libgame.so

adb push libswappy.so /data/data/com.rekoo.pubgm/lib/libswappy.so
adb push libswappy.so /data/app/com.rekoo.pubgm-1/lib/arm/libswappy.so

TIMEOUT 3


