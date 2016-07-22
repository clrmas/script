@echo off
setlocal
  mkdir E_MHP
  cd E_MHP                                                                        
copy ../VDParam_init.conf VDParam_Setting1_E_MHP_SYMME_WEIGHT.conf
copy ../VDParam_init.conf VDParam_Setting1_E_MHP_BOTTOM_WEIGHT.conf
copy ../VDParam_init.conf VDParam_Setting1_E_MHP_EDGE_WEIGHT.conf
copy ../VDParam_init.conf VDParam_Setting1_E_MHP_MAX_CONFIRM_COUNT.conf
copy ../VDParam_init.conf VDParam_Setting1_E_MHP_MIN_ASPECT_RATIO.conf
copy ../VDParam_init.conf VDParam_Setting1_E_MHP_MIN_HORI_FEAT_CONFI_THRE.conf
copy ../VDParam_init.conf VDParam_Setting1_E_MHP_LOCATE_WIDTH.conf

call :FindReplace "E_MHP_SYMME_WEIGHT=15" "E_MHP_SYMME_WEIGHT=10" VDParam_Setting1_E_MHP_SYMME_WEIGHT.conf
call :FindReplace "E_MHP_BOTTOM_WEIGHT=35" "E_MHP_BOTTOM_WEIGHT=20" VDParam_Setting1_E_MHP_BOTTOM_WEIGHT.conf
call :FindReplace "E_MHP_EDGE_WEIGHT=40" "E_MHP_EDGE_WEIGHT=20" VDParam_Setting1_E_MHP_EDGE_WEIGHT.conf
call :FindReplace "E_MHP_MAX_CONFIRM_COUNT=10" "E_MHP_MAX_CONFIRM_COUNT=5" VDParam_Setting1_E_MHP_MAX_CONFIRM_COUNT.conf
call :FindReplace "E_MHP_MIN_ASPECT_RATIO=70" "E_MHP_MIN_ASPECT_RATIO=40" VDParam_Setting1_E_MHP_MIN_ASPECT_RATIO.conf
call :FindReplace "E_MHP_MIN_HORI_FEAT_CONFI_THRE=1" "E_MHP_MIN_HORI_FEAT_CONFI_THRE=-" VDParam_Setting1_E_MHP_MIN_HORI_FEAT_CONFI_THRE.conf
call :FindReplace "E_MHP_LOCATE_WIDTH=2" "E_MHP_LOCATE_WIDTH=1" VDParam_Setting1_E_MHP_LOCATE_WIDTH.conf

cd ..
  mkdir E_UBP
  cd E_UBP  
copy ../VDParam_init.conf VDParam_Setting1_E_UBP_STAT_TIMEOUT.conf
copy ../VDParam_init.conf VDParam_Setting1_E_UBP_STAT_DURABLE.conf
copy ../VDParam_init.conf VDParam_Setting1_E_UBP_STAT_WATCHWIN.conf
copy ../VDParam_init.conf VDParam_Setting1_E_UBP_FLOWPYRLK_WINSIZE.conf
copy ../VDParam_init.conf VDParam_Setting1_E_UBP_EDGE_EXT_WIDTH.conf
copy ../VDParam_init.conf VDParam_Setting1_E_UBP_EDGE_INT_WIDTH.conf
copy ../VDParam_init.conf VDParam_Setting1_E_UBP_LK_FB_THRE.conf
copy ../VDParam_init.conf VDParam_Setting1_E_UBP_LK_TRACK_THRE_100.conf
copy ../VDParam_init.conf VDParam_Setting1_E_UBP_TRACK_RESIZE_THRE.conf
cd ..
  mkdir E_RI
  cd E_RI  
copy ../VDParam_init.conf VDParam_Setting1_E_RI_HOR_STEPWIDTH_MM.conf
copy ../VDParam_init.conf VDParam_Setting1_E_RI_VER_STEPWIDTH_MM.conf
copy ../VDParam_init.conf VDParam_Setting1_E_RI_LRSEARCHREGION_MM.conf
copy ../VDParam_init.conf VDParam_Setting1_E_RI_FRONTSEARCHREGION_M.conf
copy ../VDParam_init.conf VDParam_Setting1_E_RI_STEP_LENGTH_RATIO.conf
copy ../VDParam_init.conf VDParam_Setting1_E_RI_CRITICAL_MIN_VEHICLE_WIDTH.conf
copy ../VDParam_init.conf VDParam_Setting1_E_RI_MIN_VEHICLE_WIDTH.conf
copy ../VDParam_init.conf VDParam_Setting1_E_RI_RESIZE_IMG_WIDTH.conf
copy ../VDParam_init.conf VDParam_Setting1_E_RI_RESIZE_IMG_HEIGHT.conf
copy ../VDParam_init.conf VDParam_Setting1_E_RI_SEARCH_BLOCK_NUM.conf
copy ../VDParam_init.conf VDParam_Setting1_E_RI_BLOCK_WIDTH_CM_LEVEL1.conf
copy ../VDParam_init.conf VDParam_Setting1_E_RI_BLOCK_WIDTH_CM_LEVEL2.conf
copy ../VDParam_init.conf VDParam_Setting1_E_RI_BLOCK_WIDTH_CM_LEVEL3.conf
copy ../VDParam_init.conf VDParam_Setting1_E_RI_BLOCK_WIDTH_CM_LEVEL4.conf
copy ../VDParam_init.conf VDParam_Setting1_E_RI_BLOCK_WIDTH_CM_LEVEL5.conf


call :FindReplace "E_HOR_STEPWIDTH_MM=500" "E_HOR_STEPWIDTH_MM=300" VDParam_init.conf

exit /b 

:FindReplace <findstr> <replstr> <file>
set tmp="%temp%\tmp.txt"
If not exist %temp%\_.vbs call :MakeReplace
for /f "tokens=*" %%a in ('dir "%3" /s /b /a-d /on') do (
  for /f "usebackq" %%b in (`Findstr /mic:"%~1" "%%a"`) do (
    echo(&Echo Replacing "%~1" with "%~2" in file %%~nxa
    <%%a cscript //nologo %temp%\_.vbs "%~1" "%~2">%tmp%
    if exist %tmp% move /Y %tmp% "%%~dpnxa">nul
  )
)
del %temp%\_.vbs
exit /b

:MakeReplace
>%temp%\_.vbs echo with Wscript
>>%temp%\_.vbs echo set args=.arguments
>>%temp%\_.vbs echo .StdOut.Write _
>>%temp%\_.vbs echo Replace(.StdIn.ReadAll,args(0),args(1),1,-1,1)
>>%temp%\_.vbs echo end with