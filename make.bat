@set OUTPUT_NAME=wtee
@if not exist build mkdir build
@if exist build\OutputName.h del build\OutputName.h
@if exist build\%OUTPUT_NAME%.exe del build\%OUTPUT_NAME%.exe

@echo #define OUTPUT_NAME "%OUTPUT_NAME%" > build\OutputName.h

cl /nologo /c /D_CRT_SECURE_NO_WARNINGS /W3 /WX /MT /O2 /Ibuild wintee.c
@if not [%ERRORLEVEL%]==[0] goto :END
link /nologo /OUT:build\%OUTPUT_NAME%.exe wintee.obj
@if not [%ERRORLEVEL%]==[0] goto :END

@echo %OUTPUT_NAME%.exe is generated in build folder!
:END
@del *.obj