:: Name:     java version switcher (jvs.bat)
:: Purpose:  Switches between java and maven versions for cmd sessions.
:: Author:   Can Kurt
:: GitHub:   https://github.com/cccaaannn

@echo off
cls

set "v_JAVA_VERSION="
set "v_M2_VERSION="
set "v_SET_MAVEN_FLAG=0"


:: --- Argument parsing ---

IF "%1" == "" (
    goto :no-java-version-provided-error
) 

IF "%1" == "-h" (
    goto :help
)

IF "%1" == "--help" (
    goto :help
)

IF "%1" == "-a" (
    goto :about
)

IF "%1" == "--about" (
    goto :about 
)

IF "%1" == "-m" (
    goto :only-maven-version-provided-error
)

IF "%2" == "-m" (
  IF not "%3" == "" (
    set v_SET_MAVEN_FLAG=1
  )
)


:: --- Set java version --- 
goto :set-java-home
:set-java-home-return

:: --- Set maven version ---
IF "%v_SET_MAVEN_FLAG%"=="1" (
    goto :set-maven-home
)
:set-maven-home-return

goto :success
goto :EOF



:: --- Functions ---

:: Success condition
:success
TITLE CMD jvs (JAVA %v_JAVA_VERSION%)
color
echo Java version switched by
echo    _           
echo   (_)_   _____ 
echo   ^| \ \ / / __^|
echo   ^| ^|\ V /\__ \
echo  _/ ^| \_/ ^|___/
echo ^|__/           
echo:
:: Start the new terminal with new java version
IF "%v_SET_MAVEN_FLAG%"=="1" (
    cmd /k mvn --version
) else (
    cmd /k java -version
)
goto :EOF


:: Set java version
:set-java-home
set v_JAVA_VERSION=%1

:: Set NEW_JAVA_HOME variable
set v_NEW_JAVA_HOME=JAVA_HOME_%v_JAVA_VERSION%

:: Set nested env variable back to itself
call set "v_NEW_JAVA_HOME=%%%v_NEW_JAVA_HOME%%%"

:: If environment not exits return error.
IF "%v_NEW_JAVA_HOME%"=="" (
    goto :invalid-java-version-provided-error
)

:: If java version exists proceed
:: Set new JAVA_HOME
set JAVA_HOME=%v_NEW_JAVA_HOME%
set "Path=%v_NEW_JAVA_HOME%\bin;%Path%"
goto :set-java-home-return


:: Set maven version
:set-maven-home
set v_M2_VERSION=%3

:: Set NEW_M2_HOME variable
set v_NEW_M2_HOME=M2_HOME_%v_M2_VERSION%

:: Set nested env variable back to itself
call set "v_NEW_M2_HOME=%%%v_NEW_M2_HOME%%%"

:: If environment not exits return error.
IF "%v_NEW_M2_HOME%"=="" (
    goto :invalid-maven-version-provided-error
)

:: If maven version exists proceed
:: Set new M2_HOME
set M2_HOME=%v_NEW_M2_HOME%
set "Path=%v_NEW_M2_HOME%\bin;%Path%"
goto :set-maven-home-return


:: Help menu
:help
TITLE jvs help
color
echo --- Java Version Switcher --- 
echo Switches between java and maven versions.
echo:
echo - Script setup
echo    1- In addition to regular JAVA_HOME environment variable, different java versions has to be set as environment variables in order to script to work.
echo    2- Environment variable naming should follow this standard "JAVA_HOME_<VERSION>". Ex: JAVA_HOME_18
echo    3- Using same naming standard, more M2_HOME variables can also be set for maven version switching "M2_HOME_<VERSION>". Ex: M2_HOME_3.6
echo:
echo - Commands
echo    -h         Prints this help message.
echo    -m         Used for switching maven version.
echo:
echo - Usage
echo    jvs ^<JAVA_VERSION^>
echo    jvs ^<JAVA_VERSION^> -m ^<MAVEN_VERSION^>
echo:
echo - Examples
echo    jvs 18
echo    jvs 1.8 -m 3.6
echo    jvs 17 -m 3.8
goto :EOF

:: About menu
:about
TITLE jvs about
color
echo Java Version Switcher
echo    _           
echo   (_)_   _____ 
echo   ^| \ \ / / __^|
echo   ^| ^|\ V /\__ \
echo  _/ ^| \_/ ^|___/
echo ^|__/           
echo:
echo By: Can Kurt
echo https://github.com/cccaaannn
goto :EOF


:: Error functions
:invalid-java-version-provided-error
TITLE jvs ERROR 
color 04
echo ERROR 
echo Provied java version "%v_JAVA_VERSION%" is not set as an environment variable, it must be set as "JAVA_HOME_%v_JAVA_VERSION%".
echo Java version is not changed.
echo For more info run "jvs -h".
goto :EOF

:invalid-maven-version-provided-error
TITLE jvs ERROR 
color 04
echo ERROR 
echo Provied maven version "%v_M2_VERSION%" is not set as an environment variable, it must be set as "M2_HOME_%v_M2_VERSION%".
echo Java version is not changed.
echo For more info run "jvs -h".
goto :EOF

:only-maven-version-provided-error
TITLE jvs ERROR 
color 04
echo ERROR 
echo You must provide a java version.
echo For more info run "jvs -h".
goto :EOF

:no-java-version-provided-error
TITLE jvs ERROR 
color 04 
cmd /k echo ERROR ^&^& echo No java version provided. ^&^& echo For more info run "jvs -h".
goto :EOF
