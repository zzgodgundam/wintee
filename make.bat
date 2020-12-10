@set OUTPUT_NAME=wtee
@if not exist Build mkdir Build
@if exist Build\OutputName.h del Build\OutputName.h
@if exist Build\%OUTPUT_NAME%.exe del Build\%OUTPUT_NAME%.exe

@echo #define OUTPUT_NAME "%OUTPUT_NAME%" > Build\OutputName.h

cl /nologo /c /D_CRT_SECURE_NO_WARNINGS /W3 /WX /MT /O2 /IBuild wintee.c
@if not [%ERRORLEVEL%]==[0] goto :END
link /nologo /OUT:Build\%OUTPUT_NAME%.exe wintee.obj
@if not [%ERRORLEVEL%]==[0] goto :END

@echo %OUTPUT_NAME%.exe is generated in Build folder!
:END
@del *.obj