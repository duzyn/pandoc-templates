@REM Use with admin right or open developer mode

rmdir /s /q "%APPDATA%\pandoc"
mklink /j "%APPDATA%\pandoc" "%~dp0"