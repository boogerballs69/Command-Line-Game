@echo off
Title Command-Line Game
:top (
cls
echo COMMAND
echo        LINE
echo            GAME...
echo Type "Start" to play.
set /p "input=->"
if /i %input%==Start goto setup
if /i %input%==Debug goto debug
echo Invalid input..
timeout 3
goto top
)

:debug (
set /a "fightnum=0"
set /a "health=10000"
set /a "strength=10"
set /a "moneydollars=10000"
set /a "moneycents=00"
echo HP=%health% - ST=%strength% - $$=%moneydollars%.%moneycents% - FIGHTS=%fightnum%"
echo type event to goto:
set /p "input=->"
goto %input%
)

:stats (
set /a "fightnum=0"
set /a "health=100"
set /a "strength=1"
set /a "moneydollars=25"
set /a "moneycents=00"
echo HP=%health% - ST=%strength% - $$=%moneydollars%.%moneycents% - FIGHTS=%fightnum%"
goto start

:setup (
goto stats
)

:start (
echo - 
echo Fight or explore?
set /p "input=->"
if /i %input%==fight goto fight%fightnum%
if /i %input%==explore goto explore
)

:fight0 (
set /a "fightnum=%fightnum%+1"
set /a "enemyhp=99+(%fightnum%*2)"
echo F  I  G  H  T
echo Your HP: %health%. Enemy HP: %enemyhp%
echo Strike, Defend, or Run?
set /p "input=->"
if /i %input%==strike goto strikerandom
if /i %input%==defend goto defend
if /i %input%==run goto run
echo invalid input
set /a "fightnum=%fightnum%-1"
goto fight0
)

:strikerandom (
set /a "critchance=%random%"
if %critchance% LSS 16384 set /a "crit=0"
if %critchance% GTR 16384 set /a "crit=1"
)

:hitrandom (
set /a "hitchance=%random%"
if %hitchance% LSS 16384 set /a "hit=0"
if %hitchance% GTR 16384 set /a "hit=1"
goto strike1
)

:strike (
echo You chose "%input%"
if %crit%==0 echo Normal hit
if %crit%==1 echo Critical hit
goto hitrandom
)

:strike1 (
if %hit%==0 echo Miss
if %hit%==1 echo Hit
if %hit%==1 goto strik2
)

:strike2 (
if %hit%==1 set /a "%enemyhp%=%enemyhp%-(5+((%crit%*2))
if %hit%==0 set /a "health=%health%-3"
echo -3 HP
echo  HP: %health%
pause
)