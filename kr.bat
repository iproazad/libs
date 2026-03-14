@echo off
:: إعادة تشغيل خادم ADB
adb.exe kill-server
adb.exe start-server

echo --- Phase 1: Pre-Injection Prep (Pulling Original Library) ---


echo --- Phase 2: Deep Cleanup ---

:: مسح سجلات التتبع والديمو (ShadowTracker)
adb shell rm -rf /sdcard/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs
adb shell rm -rf /sdcard/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Demos
adb shell rm -rf /sdcard/Android/data/com.pubg.krmobile/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/MoviesPakDir

:: مسح سجلات الانهيار (Anti-Report)
adb shell rm -rf /data/data/com.pubg.krmobile/app_crashrecord
adb shell rm -rf /data/data/com.pubg.krmobile/files/CrashSight

:: تعطيل متجر جوجل بلاي
adb shell pm disable-user --user 0 com.android.vending

echo --- Phase 3: Injection & Permissions ---

:: حذف الملفات القديمة لضمان نظافة العملية [cite: 15]

adb shell rm -f /data/data/com.pubg.krmobile/lib/libswappy.so

:: رفع الملفات المعدلة وإعطاؤها صلاحيات كاملة [cite: 14, 15]
adb push libgame.so /data/data/com.pubg.krmobile/lib/libgame.so
adb shell chmod 777 /data/data/com.pubg.krmobile/lib/libgame.so

adb push libswappy.so /data/data/com.pubg.krmobile/lib/libswappy.so
adb shell chmod 777 /data/data/com.pubg.krmobile/lib/libswappy.so

:: إنشاء مجلد التمويه ورفع مكتبة الهوك [cite: 14]
adb shell mkdir -p /data/local/tmp/andriod
adb push libkeysuperman.so /data/local/tmp/andriod/libkeysuperman.so
adb shell chmod 777 /data/local/tmp/andriod/libkeysuperman.so

echo --- Phase 4: Launch & Monitor ---

:: إيقاف إجباري ثم تشغيل اللعبة 
adb shell am force-stop com.pubg.krmobile


echo Waiting for memory load...
timeout /t 3

:: جلب العناوين الأساسية (Base Addresses) [cite: 18, 19]
for /f "tokens=1" %%a in ('adb shell pidof com.pubg.krmobile') do set PID=%%a
if "%PID%" NEQ "" (
   adb shell "cat /proc/%PID%/maps | grep -m 1 libUE4.so"
)

pause
