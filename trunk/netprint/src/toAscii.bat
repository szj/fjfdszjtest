@echo off
rem =========================================================================
rem =   ���ڽ�webwork�µ�messages_zh_CN.properties�����ļ�ת����Ascii��     =
rem =                            chenf 20060102                             =
rem =========================================================================
echo ��黷��...
if not "%JAVA_HOME%" == "" goto okHome
echo ��鲻��[JAVA_HOME]����,�밴���·��ṩ��
echo �һ�[�ҵĵ���]ѡ��[����]-[��������],�½���JAVA_HOMEΪ����,ֵΪjsdk�İ�װ·��.
goto end
:okHome
if exist "%JAVA_HOME%\bin\native2ascii.exe" goto okCommand
echo �����Ҳ���%JAVA_HOME%\bin\native2ascii.exe�ļ�
goto end
:okCommand
set path = %JAVA_HOME%\bin
if exist "tmp.txt" goto okFile
goto failFile
:failFile
echo �����Ҳ���tmp.txt�ļ�
goto end
:okFile
echo ��ʼ��[tmp]ת����Ascii��������ļ�[messages_zh_CN.properties]...
native2ascii.exe tmp.txt messages_zh_CN.properties
echo ת����ɣ�
goto succeed
:end
echo ת��ʧ�ܣ�
:succeed