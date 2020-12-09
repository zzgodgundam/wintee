@set OUTPUT_NAME=wintee
@if not exist build mkdir build
@if exist build\%OUTPUT_NAME%.exe del build\%OUTPUT_NAME%.exe

cl /nologo /c /D_CRT_SECURE_NO_WARNINGS /W3 /WX /MT /O2 wintee.c
@if not [%ERRORLEVEL%]==[0] goto :END
link /nologo /OUT:build\%OUTPUT_NAME%.exe wintee.obj
@if not [%ERRORLEVEL%]==[0] goto :END

@echo %OUTPUT_NAME%.exe is generated in build folder!
:END
@del *.obj