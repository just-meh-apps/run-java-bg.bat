@echo off
REM SPDX-License-Identifier: MIT
REM Copyright (c) 2026 just-meh-apps@gmail.com
REM AI-Generated: This script was optimized for path error handling.

setlocal

:: ==========================================
:: 1. 사용자 설정 경로 (필요 시 주석 해제 후 경로 입력)
:: ==========================================
:: set "DEFAULT_JAVA_HOME=C:\Program Files\Java\jdk-17"

:: ==========================================
:: 2. JAVA_HOME 결정 로직 (우선순위 적용)
:: ==========================================
set "FINAL_JAVA="

if defined DEFAULT_JAVA_HOME (
    :: 1순위: 이 파일 상단에 지정한 경로
    set "FINAL_JAVA=%DEFAULT_JAVA_HOME%"
) else if defined JAVA_HOME (
    :: 2순위: 시스템 환경 변수 JAVA_HOME
    set "FINAL_JAVA=%JAVA_HOME%"
) else if defined JDK_HOME (
    :: 3순위: 시스템 환경 변수 JDK_HOME
    set "FINAL_JAVA=%JDK_HOME%"
)

:: ==========================================
:: 3. 최종 확인 및 실행
:: ==========================================
:: 자바 경로를 아예 찾지 못한 경우
if "%FINAL_JAVA%"=="" (
    echo [오류] Java 경로를 찾을 수 없습니다.
    echo DEFAULT_JAVA_HOME 설정이나 시스템 환경 변수(JAVA_HOME)를 확인하세요.
    pause
    exit /b
)

:: 전달받은 JAR 파일 인수가 없는 경우
if "%~1"=="" (
    echo [오류] 실행할 JAR 파일 경로가 전달되지 않았습니다.
    pause
    exit /b
)

set "TARGET_JAR=%~f1"
set "JAR_DIR=%~dp1"

pushd "%JAR_DIR%"
:: 실행 파일 존재 여부 확인 후 실행
if exist "%FINAL_JAVA%\bin\javaw.exe" (
    start  /min "" "%FINAL_JAVA%\bin\javaw.exe" -jar "%TARGET_JAR%"
) else (
    echo [오류] 지정된 경로에 javaw.exe가 없습니다: "%FINAL_JAVA%\bin\"
    pause
)
popd

endlocal
exit /b
