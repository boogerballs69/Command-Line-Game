DELETE THIS
LAST EDITTING CONTINUE AND DEATH
STATS2


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
set /a "enemyhp=100+(%fightnum%*2)"
echo - 
echo Fight or explore?
set /p "input=->"
if /i %input%==fight goto fight%fightnum%
if /i %input%==explore goto explore
if /i %input%==fight set /a "fightnum=%fightnum%+1"
)

:fight0 (
if %health% LEQ 0 goto death
if %enemyhp% LEQ 0 goto win
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
goto strike
)

:hitrandom (
set /a "hitchance=%random%"
if %hitchance% LSS 10384 set /a "hit=0"
if %hitchance% GTR 10384 set /a "hit=1"
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
if %hit%==0 goto strike2
if %hit%==1 echo Hit
if %hit%==1 goto strike2
)

:strike2 (
if %hit%==1 set /a "enemyhp=(%enemyhp%-5)"
if %hit%==1 if %crit%==1 set /a "enemyhp=(%enemyhp%-5)
if %hit%==1 goto hitecho
if %hit%==0 set /a "health=%health%-3"
if %hit%==0 goto missecho
)

:hitecho (
echo Enemy HP: %enemyhp%
goto fight0
)

:missecho (
echo HP: %health%
goto fight0
)

:death (
echo YOU DIED
echo Continue?
echo Yes or no
set /p "input=->"
if /i %input%==yes goto continue
if /i %input%==no goto dontcontinue
echo invalid input
goto death
)

:continue (
set /a "losses=(%losses%+1)"
goto stats2
)

:win (
echo YOU WIN
set /a "wins=(%wins%+1)"
goto stats
)