@echo off

call "%~dp0\pip_install.cmd" pyls "python-language-server[all]"
move pyls pyls-all
