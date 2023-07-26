@echo off
rmdir /s /q "%APPDATA%\pandoc"
gsudo mklink /j "%APPDATA%\pandoc" "%~dp0"
