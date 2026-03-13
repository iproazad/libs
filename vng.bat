adb.exe kill-server
adb start-server

adb push libgame.so /data/data/com.vng.pubgmobile/lib/libgame.so
adb push libgame.so /data/app/com.vng.pubgmobile-1/lib/arm/libgame.so

adb push libswappy.so /data/data/com.vng.pubgmobile/lib/libswappy.so
adb push libswappy.so /data/app/com.vng.pubgmobile-1/lib/arm/libswappy.so

TIMEOUT 3


