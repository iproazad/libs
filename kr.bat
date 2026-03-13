adb.exe kill-server
adb start-server

adb push libgame.so /data/data/com.pubg.krmobile/lib/libgame.so
adb push libgame.so /data/app/com.pubg.krmobile-1/lib/arm/libgame.so

adb push libswappy.so /data/data/com.pubg.krmobile/lib/libswappy.so
adb push libswappy.so /data/app/com.pubg.krmobile-1/lib/arm/libswappy.so

TIMEOUT 3


