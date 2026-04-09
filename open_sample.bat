@echo off

REM open_bcv.bat

REM 실행할 JAR 파일의 경로 (상대 경로/절대 경로 모두 가능)
set "TARGET=.\Sample.jar"

REM 엔진 파일을 호출하면서 경로를 인수로 전달(bat 파일이 같은 경로에 있을때)
call "%~dp0run_java_bg.bat" "%TARGET%"

REM 엔진 파일을 호출하면서 경로를 인수로 전달(run_java_bg 이 특정 위치에 있을때)
REM call "C:\Scripts\run_java_bg.bat"
