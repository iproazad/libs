@echo off
:: إعادة تشغيل خادم ADB
adb.exe kill-server
adb.exe start-server

:: مسح سجلات التتبع والديمو (ShadowTracker)
adb shell rm -rf /sdcard/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs
adb shell rm -rf /sdcard/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Demos
adb shell rm -rf /sdcard/Android/data/com.vng.pubgmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/MoviesPakDir

:: مسح سجلات الانهيار (Anti-Report)
adb shell rm -rf /data/data/com.vng.pubgmobile/app_crashrecord
adb shell rm -rf /data/data/com.vng.pubgmobile/files/CrashSight

:: تعطيل متجر جوجل بلاي
adb shell pm disable-user --user 0 com.android.vending

echo --- Phase 3: Injection & Permissions ---

:: حذف الملفات القديمة لضمان نظافة العملية [cite: 15]

adb shell rm -f /data/data/com.vng.pubgmobile/lib/libAkAudioVisiual.so

:: رفع الملفات المعدلة وإعطاؤها صلاحيات كاملة [cite: 14, 15]
adb push libAkAudioVisiual.so /data/data/com.vng.pubgmobile/lib/libAkAudioVisiual.so
adb shell chmod 777 /data/data/com.vng.pubgmobile/lib/libAkAudioVisiual.so


echo Waiting for memory load...
timeout /t 1
