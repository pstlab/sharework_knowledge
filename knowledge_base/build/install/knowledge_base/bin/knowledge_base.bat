@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  knowledge_base startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and KNOWLEDGE_BASE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\knowledge_base-0.1.0.jar;%APP_HOME%\lib\rosjava-0.3.7.jar;%APP_HOME%\lib\jena-tdb-3.1.0.jar;%APP_HOME%\lib\jena-arq-3.1.0.jar;%APP_HOME%\lib\jena-core-3.15.0.jar;%APP_HOME%\lib\apache_xmlrpc_server-0.3.7.jar;%APP_HOME%\lib\apache_xmlrpc_client-0.3.7.jar;%APP_HOME%\lib\apache_xmlrpc_common-0.3.7.jar;%APP_HOME%\lib\rosjava_test_msgs-0.3.0.jar;%APP_HOME%\lib\rosgraph_msgs-1.11.2.jar;%APP_HOME%\lib\nav_msgs-1.12.7.jar;%APP_HOME%\lib\tf2_msgs-0.5.20.jar;%APP_HOME%\lib\geometry_msgs-1.12.7.jar;%APP_HOME%\lib\actionlib_msgs-1.12.7.jar;%APP_HOME%\lib\std_msgs-0.5.12.jar;%APP_HOME%\lib\message_generation-0.3.3.jar;%APP_HOME%\lib\dnsjava-2.1.1.jar;%APP_HOME%\lib\com.springsource.org.apache.commons.httpclient-3.1.0.jar;%APP_HOME%\lib\com.springsource.org.apache.commons.logging-1.1.1.jar;%APP_HOME%\lib\com.springsource.org.apache.commons.net-2.0.0.jar;%APP_HOME%\lib\guava-12.0.jar;%APP_HOME%\lib\jena-base-3.15.0.jar;%APP_HOME%\lib\jena-iri-3.15.0.jar;%APP_HOME%\lib\commons-cli-1.4.jar;%APP_HOME%\lib\libthrift-0.9.2.jar;%APP_HOME%\lib\jsonld-java-0.7.0.jar;%APP_HOME%\lib\jcl-over-slf4j-1.7.20.jar;%APP_HOME%\lib\slf4j-api-1.7.30.jar;%APP_HOME%\lib\ws-commons-util-1.0.1.jar;%APP_HOME%\lib\netty-3.5.2.Final.jar;%APP_HOME%\lib\com.springsource.org.apache.commons.codec-1.3.0.jar;%APP_HOME%\lib\com.springsource.org.apache.commons.io-1.4.0.jar;%APP_HOME%\lib\commons-pool-1.6.jar;%APP_HOME%\lib\com.springsource.org.apache.commons.lang-2.4.0.jar;%APP_HOME%\lib\gradle_plugins-0.3.3.jar;%APP_HOME%\lib\junit-3.8.2.jar;%APP_HOME%\lib\jsr305-1.3.9.jar;%APP_HOME%\lib\jena-shaded-guava-3.15.0.jar;%APP_HOME%\lib\commons-csv-1.8.jar;%APP_HOME%\lib\commons-io-2.6.jar;%APP_HOME%\lib\commons-lang3-3.10.jar;%APP_HOME%\lib\httpclient-cache-4.2.6.jar;%APP_HOME%\lib\httpclient-4.2.6.jar;%APP_HOME%\lib\commons-codec-1.14.jar;%APP_HOME%\lib\commons-compress-1.20.jar;%APP_HOME%\lib\collection-0.7.jar;%APP_HOME%\lib\xml-apis-1.0.b2.jar;%APP_HOME%\lib\httpcore-4.2.5.jar;%APP_HOME%\lib\jackson-databind-2.3.3.jar;%APP_HOME%\lib\jackson-core-2.3.3.jar;%APP_HOME%\lib\jackson-annotations-2.3.0.jar;%APP_HOME%\lib\commons-logging-1.1.1.jar

@rem Execute knowledge_base
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %KNOWLEDGE_BASE_OPTS%  -classpath "%CLASSPATH%" org.ros.RosRun %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable KNOWLEDGE_BASE_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%KNOWLEDGE_BASE_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
