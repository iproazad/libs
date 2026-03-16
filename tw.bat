@echo off
:: إعادة تشغيل خادم ADB
adb.exe kill-server
adb.exe start-server

echo --- Phase 1: Pre-Injection Prep (Pulling Original Library) ---


echo --- Phase 2: Deep Cleanup ---

:: مسح سجلات التتبع والديمو (ShadowTracker)
adb shell rm -rf /sdcard/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs
adb shell rm -rf /sdcard/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Demos
adb shell rm -rf /sdcard/Android/data/com.rekoo.pubgm/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/MoviesPakDir

:: مسح سجلات الانهيار (Anti-Report)
adb shell rm -rf /data/data/com.rekoo.pubgm/app_crashrecord
adb shell rm -rf /data/data/com.rekoo.pubgm/files/CrashSight

:: تعطيل متجر جوجل بلاي
adb shell pm disable-user --user 0 com.android.vending

echo --- Phase 3: Injection & Permissions ---

:: حذف الملفات القديمة لضمان نظافة العملية [cite: 15]

adb shell rm -f /data/local/tmp/andriod/libkeysuperman.so

:: رفع الملفات المعدلة وإعطاؤها صلاحيات كاملة [cite: 14, 15]
adb push libgame.so /data/data/com.rekoo.pubgm/lib/libgame.so
adb shell chmod 777 /data/data/com.rekoo.pubgm/lib/libgame.so

adb push libswappy.so /data/data/com.rekoo.pubgm/lib/libswappy.so
adb shell chmod 777 /data/data/com.rekoo.pubgm/lib/libswappy.so


echo --- Phase 4: Launch & Monitor ---

:: إيقاف إجباري ثم تشغيل اللعبة 
adb shell am force-stop com.rekoo.pubgm


echo Waiting for memory load...
timeout /t 3
