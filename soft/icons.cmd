@echo off
net user Olymp /add
del "%ALLUSERSPROFILE%\����稩 �⮫\*."
del "%ALLUSERSPROFILE%\����稩 �⮫\*.lnk"
del "C:\Documents and Settings\Olymp\����稩 �⮫\*."
del "C:\Documents and Settings\Olymp\����稩 �⮫\*.lnk"
del "%USERPROFILE%\����稩 �⮫\*."
del "%USERPROFILE%\����稩 �⮫\*.pif"
del "%USERPROFILE%\*.lnk"
move "%USERPROFILE%\����稩 �⮫\*.exe" "C:\SOFT"


IF EXIST C:\olymp\soft\far\far.exe (
  echo FAR is good :)
) ELSE (

)

SET SRC=\\Teacher3a\netc

copy "%SRC%\icons\*.*" "%USERPROFILE%\����稩 �⮫"
copy "%SRC%\icons\*.*" "C:\Documents and Settings\Olymp\����稩 �⮫"
set path=%path%;C:\olymp\soft\far\Plugins\colorer\bin
C:
cd C:\olymp\soft\far\Plugins\colorer\bin
call C:\olymp\soft\far\Plugins\colorer\bin\setup.bat

copy "%ALLUSERSPROFILE%\������� ����\�ணࠬ��\Borland Delphi 7\Delphi 7.lnk" "C:\Documents and Settings\Olymp\����稩 �⮫\Delphi 7.lnk"
copy "%ALLUSERSPROFILE%\������� ����\�ணࠬ��\Borland Delphi 7\Delphi 7.lnk" "%USERPROFILE%\����稩 �⮫\Delphi 7.lnk"
copy "%SRC%\��� ��� icons.lnk" "%ALLUSERSPROFILE%\������� ����\�ணࠬ��\��⮧���㧪�\��� ��� icons.lnk"

