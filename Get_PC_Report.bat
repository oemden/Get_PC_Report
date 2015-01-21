@ECHO OFF
REM ==============================
REM Olivier oem@oemden.com
REM v2
REM
REM ==============================

REM Name the file report

SET FILE=%userprofile%\%computername%_%username%.txt

echo ======== %DATE% ================ >> %FILE%
echo ==== PC INVENTORY  ==== >> %FILE%
echo ==================================== >> %FILE%

echo ======= USERNAME =================== >> %FILE%
echo %username% >> %FILE%

echo ======= computername =============== >> %FILE%
echo %computername% >> %FILE%


echo ======= Serial Number And Model ==== >> %FILE%
wmic /append:"%FILE%" csproduct get name,vendor,identifyingnumber >> nul


echo ======= Installed Programs ========= >> %FILE%
REM wmic /append:"%FILE%" product get vendor,name,version >> nul
wmic /append:"%FILE%" product get vendor,name >> nul


echo ======= Drives ===================== >> %FILE%
wmic /append:"%FILE%" logicaldisk get name >> nul


echo ======= Network Drives ============= >> %FILE%
Net use >> %FILE%


echo ======= Printers ============= >> %FILE%
wmic /append:"%FILE%" printer get name >> nul


echo ======= list C Drive =============== >> %FILE%
C:
cd /
dir >> %FILE%
