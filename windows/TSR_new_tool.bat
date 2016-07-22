
@echo off


SET File1=VGA_20160606_13h31m09s_Regular.avi
SET File2=VGA_20160606_14h22m55s_Regular.avi
SET File3=VGA_20160606_19h09m51s_Regular.avi


@echo hello,are you sure begin with %1 second?
pause

cd C:\en_work\TSR\new_tools\TSR
del result.txt

:parse
IF "%1"=="1" GOTO run1
IF "%1"=="2" GOTO run2
IF "%1"=="3" GOTO run3


#SHIFT
#GOTO parse


:run1
@echo begin %File1%

MainTestWithSave0.45c.exe C:\en_work\TSR\origion_video\%File1%
@echo finished!
copy result.txt TSR_3f_result_%File1%.txt
rename IMG IMG_TSR_3f_%File1%
cd ..
GOTO endparse

:run2
MainTestWithSave0.45c.exe C:\en_work\TSR\origion_video\%File2%
@echo finished!
copy result.txt TSR_3f_result_%File2%.txt
rename IMG IMG_TSR_3f_%File2%
cd ..
GOTO endparse

:run3
MainTestWithSave0.45c.exe C:\en_work\TSR\origion_video\%File3%
copy result.txt TSR_3f_result_%File3%.txt
rename IMG IMG_TSR_3f_%File3%
cd ..
GOTO endparse

