@echo off

:: Make a copy of executable and run that copy. Why? Because then we can compile
:: and link a new executable while the mud is still running.
copy out\build\x64-Debug\bin\swrip.exe out\build\x64-Debug\bin\swrip-win.exe >NUL
out\build\x64-Debug\bin\swrip-win 7000
