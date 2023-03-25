@(IF not "%1" == "max" (start /MAX cmd /Q /C %0 max&X)ELSE set C=1&set D=2&wmic process where name="cmd.exe" CALL setpriority "REALTIME">NUL)&CLS
:: Made By koob#8912
@echo off
color 1
echo Message Through Your Webhook
set /p message="What would you like the message to be? "
set /p ping="Would you like to ping everyone? Y/N: "
if /i "%ping%"=="Y" (
    set message=%message% @everyone
)
set /p ping="Would You Like To Loop The Message? Y/N: "
if /i "%ping%"=="Y" (
    set loop=1
)
:loop
set /p webhook=<URL.txt
curl -X POST -H "Content-type: application/json" --data "{\"content\": \"%message%\"}" %webhook%
if "%loop%"=="1" (
    goto loop
) else (
    exit
)
