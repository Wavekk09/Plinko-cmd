@echo off
Title Plinko v0.1
@mode 52,9
echo.
echo.
echo   ===============================================
echo   REMINDER: THIS GAME DOES NOT SUPPORT CAPS-LOCK!
echo   MAKE SURE TO TURN IT OFF...
echo   ===============================================
echo                  PRESS ANY KEY
pause>Nul
:: This is non datasave base but still works if you wanna play on a short-run.
set /a highscore=0
:::::::::::::::::::::::MENU:::::::::::::::::::::::
:start
:: This is render the options for the menu screen. Nothing serious.
set w=x
set a=.
set s=.
set d=.
:menu
cls
@mode 44,15
echo.
echo   +=====================================+
echo   I              Plinko!                I
echo   I               v0.1                  I
echo   I                                     I
echo   I               Play!                 I
echo   I                (%w%)                  I
echo   I    Help                   Color     I
echo   I    (%a%)        Exit         (%d%)      I
echo   I                (%s%)                  I
echo   I                                     I
echo   +=====================================+
echo   I  PRESS WASD AND ENTER Y TO CONFIRM  I
echo   +=====================================+
choice /c:wasdy >Nul
if %ERRORLEVEL% ==1 goto w
if %ERRORLEVEL% ==2 goto a
if %ERRORLEVEL% ==3 goto s
if %ERRORLEVEL% ==4 goto d
if %ERRORLEVEL% ==5 goto check_position
exit

::::::::::::::::::::END_OF_MENU:::::::::::::::::::::::

:check_position
cls
:: This checks the x object placement and leads the user to the desired place.
if %s% ==x (exit)
if %a% ==x goto help
if %d% ==x goto reset
if %w% ==x goto ChooseModeSet
exit

:::::::::::::::::MODE SELECTION:::::::::::::::::
:ChooseModeSet
set j=.
set k=x
:ChooseMode
cls
@mode 45,11
echo.
echo   +=======================================+
echo   I                                       I
echo   I +===============+   +===============+ I
echo   I I   Survivial   I   I    Hearts     I I
echo   I +===============+   +===============+ I
echo   I        (%j%)                 (%k%)        I
echo   I                                       I
echo   I    PRESS AD AND PRESS Y TO CONFIRM    I
echo   +=======================================+
choice /c:adyn >nul
if %ERRORLEVEL% ==1 goto j
if %ERRORLEVEL% ==2 goto k
if %ERRORLEVEL% ==3 goto Confirm_Place
if %ERRORLEVEL% ==4 goto start

:j
if %j% ==x goto ChooseMode
set k=.
set j=x
goto ChooseMode

:k
if %k% ==x goto ChooseMode
set k=x
set j=.
goto ChooseMode

:Confirm_Place
cls
if %k% ==x goto HighScore_View
echo.
echo   +=======================================+
echo   I                                       I
echo   I     This gameplay MODE will be        I
echo   I   included in the next update! v0.2   I
echo   I                                       I
echo   I    Stay tuned for the next update!    I
echo   I                                       I
echo   I      Press any key to continue...     I
echo   +=======================================+
pause>Nul
goto ChooseModeSet

::::::::::::::::::::::HIGHSCORE_VIEW:::::::::::::::::::::::::::::::::

:HighScore_View
cls
@mode 50,14
if %highscore% ==999999999 goto Ask_Window
echo.
echo   +=======================================+
echo   I               ___________              \
echo   I              -HEARTS MODE-              \
echo   I                                          \#/
echo   I  HIGHSCORE: %highscore%-----------------------C
echo   I                                          /#\
echo   I   You're objective is to beat the       /
echo   I   highscore!                           /
echo   +=======================================+
echo   I  MAX THE HIGHSCORE AND GET A SPECIAL  I
echo   I  CUTSCENE AND THING FROM THE DEV....  I
echo   +=======================================+
pause >nul
goto GraphicsForBall

::::::::::::::::::::::::::WASD:::::::::::::::::::::::::::::::::::::::
:: Here I Have labelled each "here+num(variations)" so
:: I dont have to give each if them a different name. Nothing serious

:d
cls
if %d% ==x goto menu
if %w% ==x goto here1d
if %a% ==x goto here2d
if %s% ==x goto here3d
:here1d
set w=.
set d=x
goto menu
:here2d
set a=.
set d=x
goto menu
:here3d
set s=.
set d=x
goto menu

:s
cls
if %s% ==x goto menu
if %d% ==x goto here1c
if %a% ==x goto here2c
if %w% ==x goto here3c
:here1c
set d=.
set s=x
goto menu
:here2c
set a=.
set s=x
goto menu
:here3c
set w=.
set s=x
goto menu
 
:a
cls
if %a% ==x goto menu
if %d% ==x goto here1b
if %w% ==x goto here2b
if %s% ==x goto here3b
:here1b
set d=.
set a=x
goto menu
:here2b
set w=.
set a=x
goto menu
:here3b
set s=.
set a=x
goto menu

:w
cls
if %w% ==x goto menu
if %d% ==x goto here1a
if %a% ==x goto here2a
if %s% ==x goto here3a
:here1a
set d=.
set w=x
goto menu
:here2a
set a=.
set w=x
goto menu
:here3a
set s=.
set w=x
goto menu

::::::::::::::::::::END_OF_WASD:::::::::::::::::::

::::::::::::::::::::COLOR:::::::::::::::::::::::::
:reset
cls
set colornum1=0
set colornum2=7
set n1=x
set n2=.
:colors
cls
@mode 43,20
echo.
echo   +=====================================+
echo   I            COLORS                   I
echo   I Black  (0)        (8) Gray          I
echo   I Blue   (1)        (9) Light Blue    I
echo   I Green  (2)        (A) Light Green   I
echo   I Aqua   (3)        (B) Light Aqua    I
echo   I Red    (4)        (C) Light Red     I
echo   I Purple (5)        (D) Light Purple  I
echo   I Yellow (6)        (E) Light Yellow  I
echo   I White  (7)        (F) Bright White  I
echo   I ................................... I
echo   I    Background         Foreground    I
echo   I       (%colornum1%)        *       (%colornum2%)        I
echo   I       (%n1%)                (%n2%)        I
echo   +=====================================+
echo   I PRESS WASD TO MOVE AND CHANGE AND   I
echo   I Y TO ENTER AND N TO EXIT WITH COLOR I
echo   +=====================================+
choice /c:wasdyn >Nul
if %ERRORLEVEL% ==1 goto Check_Hex1
if %ERRORLEVEL% ==2 goto ChangeTo_Hex1
if %ERRORLEVEL% ==3 goto Check_Hex2
if %ERRORLEVEL% ==4 goto ChangeTo_Hex2
If %ERRORLEVEL% ==5 goto changecolor
if %ERRORLEVEL% ==6 goto start
exit

:Check_Hex2
if %n2% ==x goto Check_Hex2a
if %colornum1% ==0 set colornum1=F&& goto colors
if %colornum1% ==F set colornum1=E&& goto colors
if %colornum1% ==E set colornum1=D&& goto colors
if %colornum1% ==D set colornum1=C&& goto colors
if %colornum1% ==C set colornum1=B&& goto colors
if %colornum1% ==B set colornum1=A&& goto colors
if %colornum1% ==A set colornum1=9&& goto colors
if %colornum1% ==9 set colornum1=8&& goto colors
if %colornum1% ==8 set colornum1=7&& goto colors
if %colornum1% ==7 set colornum1=6&& goto colors
if %colornum1% ==6 set colornum1=5&& goto colors
if %colornum1% ==5 set colornum1=4&& goto colors
if %colornum1% ==4 set colornum1=3&& goto colors
if %colornum1% ==3 set colornum1=2&& goto colors
if %colornum1% ==2 set colornum1=1&& goto colors
if %colornum1% ==1 set colornum1=0&& goto colors
exit

:Check_Hex1
if %n2% ==x goto Check_Hex1a
if %colornum1% ==0 set colornum1=1&& goto colors
if %colornum1% ==1 set colornum1=2&& goto colors
if %colornum1% ==2 set colornum1=3&& goto colors
if %colornum1% ==3 set colornum1=4&& goto colors
if %colornum1% ==4 set colornum1=5&& goto colors
if %colornum1% ==5 set colornum1=6&& goto colors
if %colornum1% ==6 set colornum1=7&& goto colors
if %colornum1% ==7 set colornum1=8&& goto colors
if %colornum1% ==8 set colornum1=9&& goto colors
if %colornum1% ==9 set colornum1=A&& goto colors
if %colornum1% ==A set colornum1=B&& goto colors
if %colornum1% ==B set colornum1=C&& goto colors
if %colornum1% ==C set colornum1=D&& goto colors
if %colornum1% ==D set colornum1=E&& goto colors
if %colornum1% ==E set colornum1=F&& goto colors
if %colornum1% ==F set colornum1=0&& goto colors
exit

:Check_Hex2a
if %colornum2% ==1 set colornum2=0&& goto colors
if %colornum2% ==2 set colornum2=1&& goto colors
if %colornum2% ==3 set colornum2=2&& goto colors
if %colornum2% ==4 set colornum2=3&& goto colors
if %colornum2% ==5 set colornum2=4&& goto colors
if %colornum2% ==6 set colornum2=5&& goto colors
if %colornum2% ==7 set colornum2=6&& goto colors
if %colornum2% ==8 set colornum2=7&& goto colors
if %colornum2% ==9 set colornum2=8&& goto colors
if %colornum2% ==A set colornum2=9&& goto colors
if %colornum2% ==B set colornum2=A&& goto colors
if %colornum2% ==C set colornum2=B&& goto colors
if %colornum2% ==D set colornum2=C&& goto colors
if %colornum2% ==E set colornum2=D&& goto colors
if %colornum2% ==F set colornum2=E&& goto colors
if %colornum2% ==0 set colornum2=F&& goto colors
exit

:Check_Hex1a
if %colornum2% ==0 set colornum2=1&& goto colors
if %colornum2% ==1 set colornum2=2&& goto colors
if %colornum2% ==2 set colornum2=3&& goto colors
if %colornum2% ==3 set colornum2=4&& goto colors
if %colornum2% ==4 set colornum2=5&& goto colors
if %colornum2% ==5 set colornum2=6&& goto colors
if %colornum2% ==6 set colornum2=7&& goto colors
if %colornum2% ==7 set colornum2=8&& goto colors
if %colornum2% ==8 set colornum2=9&& goto colors
if %colornum2% ==9 set colornum2=A&& goto colors
if %colornum2% ==A set colornum2=B&& goto colors
if %colornum2% ==B set colornum2=C&& goto colors
if %colornum2% ==C set colornum2=D&& goto colors
if %colornum2% ==D set colornum2=E&& goto colors
if %colornum2% ==E set colornum2=F&& goto colors
if %colornum2% ==F set colornum2=0&& goto colors
exit

:ChangeTo_Hex1
if %n1% ==x goto colors
set n2=.
set n1=x
goto colors

:ChangeTo_Hex2
if %n2% ==x goto colors
set n1=.
set n2=x
goto colors

:changecolor
if %colornum1% ==%colornum2% goto colors
color %colornum1%%colornum2%
goto colors

::::::::::::::::::::END_OF_COLOR:::::::::::::::::::::

::::::::::::::::::::HELP:::::::::::::::::::::::::::::
:help
cls
@mode 43,23
echo.
echo  +=======================================+
echo  I                 Help                  I
echo  + ===================================== +
echo  I                                       I
echo  I HOW TO PLAY:                          I
echo  I *  Watch the ball fall through the    I
echo  I    Plinko Board.                      I
echo  I *  Earn money based on landing slot   I
echo  I *  Avoid the (X) slot (loses 1 heart) I
echo  I *  Lose all hearts = Game Over        I
echo  I                                       I
echo  I HEARTS MODE:                          I
echo  I *  Start with 3 hearts                I
echo  I *  Survive as long as possible        I
echo  I *  Try to earn the highest money      I
echo  I                                       I
echo  I CONTROLS:                             I
echo  I *  For Menu: WASDY                    I
echo  I *  For Game: Enter Amount and Enter   I
echo  I                                       I
echo  +=======================================+
pause>nul
cls
@mode 43,13
echo.
echo  +=======================================+
echo  I               Credits                 I
echo  I ===================================== I
echo  I                                       I
echo  I Created by Wavekk09                   I
echo  I Game: Plinko CMD (Batch Edition)      I
echo  I                                       I
echo  I Made using Windows Batch scripting    I
echo  I all in 2 hours.                       I
echo  I                                       I
echo  +=======================================+
pause>nul
cls
@mode 43,27
echo.
echo  +=======================================+
echo  I            FUTURE UPDATES             I
echo  I ===================================== I
echo  I                                       I
echo  I Planned features:-                    I
echo  I * Survival Mode (hard challenge mode) I
echo  I * Leaderboards                        I
echo  I * Player save data                    I
echo  I * Bonus wheel system                  I
echo  I * Updrades and ADD-ONS                I
echo  I * Sound effects (VBS)                 I
echo  I * More themes                         I
echo  I                                       I
echo  I NOTE:                                 I
echo  I Survival Mode is a future release.    I
echo  I Not available in v0.1                 I
echo  I                                       I
echo  I ===================================== I
echo  I                                       I
echo  I FINAL REGARDS:-                       I
echo  I This game may or may not hate you.    I
echo  I Play with caution and don't bash your I
echo  I computer.                             I
echo  I My fav color theme is F0              I
echo  +=======================================+
pause>nul
goto start
::::::::::::::::::::::END_OF_HELP:::::::::::::::::::

::::::::::::::::::::::RENDER_SUPPORT::::::::::::::::
:GraphicsForBall
cls
set a1=o
set /a turns=1
set /a lastnum=1
set letter=b
:GraphicsForBouncers
if %turns% GTR %lastnum% goto BugFix1
set %letter%%turns%=.
set /a turns+=1
goto GraphicsForBouncers

:BugFix1
cls
set %letter%%turns%=.
set /a turns=1
set /a lastnum+=1
goto letterchange

:letterchange
cls
if %letter% ==a set letter=b&& goto GraphicsForBouncers
if %letter% ==b set letter=c&& goto GraphicsForBouncers
if %letter% ==c set letter=d&& goto GraphicsForBouncers
if %letter% ==d set letter=e&& goto GraphicsForBouncers
if %letter% ==e set letter=f&& goto GraphicsForBouncers
if %letter% ==f set letter=g&& goto GraphicsForBouncers
if %letter% ==g set letter=h&& goto GraphicsForBouncers
if %letter% ==h set letter=i&& goto GraphicsForBouncers
if %letter% ==i set letter=j&& goto GraphicsForBouncers
if %letter% ==j set letter=k&& goto GraphicsForBouncers
if %letter% ==k set letter=l&& goto GraphicsForBouncers
if %letter% ==l goto SettingVariables
exit

:SettingVariables
set num1=8
set num2=5
set num3=3
set num4=X
set num5=3
set num6=5
set num7=8
set /a money=100
set message=Bet Your Money!
set /a heart=3
set preview=n
goto ChoiceView

:::::::::::::::::END_OF_RENDER_SUPPORT:::::::::::::::::::

:::::::::::::::::CHOICE_BET::::::::::::::::::::::::::::::
:ChoiceView
cls
@mode 35,24
if %heart% ==0 goto Check_Score_After_Leave
if %money% ==0 goto Trade_HeartCheck
echo.
echo   +==========+
echo   I Heart: %heart% I Money: $%money%
echo   +=============================+
echo   I                             I
echo   I              _              I
echo   I             /%a1%\             I
echo   I            /%b1%*%b2%\            I
echo   I           /%c1%*%c2%*%c3%\           I
echo   I          /%d1%*%d2%*%d3%*%d4%\          I
echo   I         /%e1%*%e2%*%e3%*%e4%*%e5%\         I
echo   I        /%f1%*%f2%*%f3%*%f4%*%f5%*%f6%\        I
echo   I       /%g1%*%g2%*%g3%*%g4%*%g5%*%g6%*%g7%\       I
echo   I      /%h1%*%h2%*%h3%*%h4%*%h5%*%h6%*%h7%*%h8%\      I
echo   I     /%i1%*%i2%*%i3%*%i4%*%i5%*%i6%*%i7%*%i8%*%i9%\     I
echo   I    /%j1%*%j2%*%j3%*%j4%*%j5%*%j6%*%j7%*%j8%*%j9%*%j10%\    I
echo   I   /%k1%*%k2%*%k3%*%k4%*%k5%*%k6%*%k7%*%k8%*%k9%*%k10%*%k11%\   I
echo   I  /%l1%*%l2%*%l3%*%l4%*%l5%*%l6%*%l7%*%l8%*%l9%*%l10%*%l11%*%l12%\  I
echo   I  I%num1%I %num2% I %num3% I %num4% I %num5% I %num6% I%num7%I  I
echo   I  -------------------------  I
echo   +=============================+
echo   I Info: %message%
echo   +=============================+
set /p choice=
if %choice% ==. goto ChoiceView
if %choice% ==%money% goto here1
if %choice% ==Q goto Check_Score_After_Leave
if %choice% ==q goto Check_Score_After_Leave
if %choice% GTR %money% set message=Invalid Input!&& goto ChoiceView
:here1
set /a money-=%choice%
set letter=a
set /a times=1
set /a lastnumber=2
set message=Ball is rolling down..
goto betping

::::::::::::::::TRADE_HEART_FOR_MONEY::::::::::::::::::::

:Trade_HeartCheck
if %heart% ==2 goto Trade_Heart
if %heart% ==3 goto Trade_Heart
set /a heartrandom=%RANDOM% * 2 / 32767
if %heartrandom% ==1 goto Check_Score
@mode 48,12
echo.
echo   +==========================================+
echo   I              -Lucky Clover-              I
echo   I                                          I
echo   I Do you wish to continue the game with    I
echo   I free $100? (This doesn't happen always)  I
echo   I                 (y/n)                    I
echo   I                                          I
echo   I    NOTE: Game will end if you press "n"  I
echo   +==========================================+
choice /c:yn >nul
if %ERRORLEVEL% ==1 set /a money=100&& goto setnull
if %ERRORLEVEL% ==2 goto Check_Score_After_Leave

:Trade_Heart
cls
@mode 48,12
echo.
echo   +==========================================+
echo   I              -Trade Heart-               I
echo   I               Hearts: %heart%                  I
echo   I Do you wish to trade one heart for $100? I
echo   I                  (y/n)                   I
echo   I                                          I
echo   I    NOTE: Game will end if you press "n"  I
echo   I                                          I
echo   +==========================================+
choice /c:yn >nul
if %ERRORLEVEL% ==1 goto Trading_Heart
if %ERRORLEVEL% ==2 goto Check_Score_After_Leave
exit

:Trading_Heart
set /a money=100
set /a heart-=1
goto setnull

:::::::::::::::END_OF_TRADE_HEART_FOR_MONEY::::::::::::::

::::::::::::::::CHECK_SCORE_AFTER_LEAVING::::::::::::::::
:Check_Score_After_Leave
cls
if %highscore% ==0 goto New_Score
if %highscore% GTR %money% goto Last_Score
if %highscore% LSS %money% goto New_Score
exit

:New_Score
cls
@mode 35,9
echo.
echo   +=============================+
echo     LAST HIGHSCORE: %highscore%
echo     NEW HIGHSCORE: %money%
echo.
echo     You've attained a new score!
echo     Share it in Github Dev Comm.
echo   +=============================+
pause >nul
set /a highscore=%money%
goto menu

:Last_Score
cls
@mode 35,9
echo.
echo   +=============================+
echo     LAST HIGHSCORE: %highscore%
echo     CURRENT SCORE: %money%
echo.
echo     You were almost going to
echo     beat your highscore!
echo   +=============================+
pause>nul
goto menu

::::::::::::::END_OF_CHECK_SCORE_AFTER_LEAVING:::::::::::::

::::::::::::::RANDOM_BALL_MOVEMENT:::::::::::::::::::::::::
:betping
set /a bet=%RANDOM% * 4 / 32767
if %bet% ==0 goto checkpossiblespaces
if %bet% ==1 goto checkpossiblespaces1
if %bet% ==2 goto checkpossiblespaces
if %bet% ==3 goto checkpossiblespaces1
exit

:checkpossiblespaces1
set %letter%%times%=.
if %letter% ==l goto specialcheck
set /a lastnumber+=1
set /a times+=1
if %letter% ==a set letter=b&& goto BugFix2a
if %letter% ==b set letter=c&& goto BugFix2a
if %letter% ==c set letter=d&& goto BugFix2a
if %letter% ==d set letter=e&& goto BugFix2a
if %letter% ==e set letter=f&& goto BugFix2a
if %letter% ==f set letter=g&& goto BugFix2a
if %letter% ==g set letter=h&& goto BugFix2a
if %letter% ==h set letter=i&& goto BugFix2a
if %letter% ==i set letter=j&& goto BugFix2a
if %letter% ==j set letter=k&& goto BugFix2a
if %letter% ==k set letter=l&& goto BugFix2a
exit

:BugFix2a
set %letter%%times%=o
goto render

:checkpossiblespaces
set %letter%%times%=.
if %letter% ==a set letter=b&& goto BugFix2b
if %letter% ==b set letter=c&& goto BugFix2b
if %letter% ==c set letter=d&& goto BugFix2b
if %letter% ==d set letter=e&& goto BugFix2b
if %letter% ==e set letter=f&& goto BugFix2b
if %letter% ==f set letter=g&& goto BugFix2b
if %letter% ==g set letter=h&& goto BugFix2b
if %letter% ==h set letter=i&& goto BugFix2b
if %letter% ==i set letter=j&& goto BugFix2b
if %letter% ==j set letter=k&& goto BugFix2b
if %letter% ==k set letter=l&& goto BugFix2b
if %letter% ==l goto specialcheck
exit

:BugFix2b
set %letter%%times%=o
goto render

:specialcheck
if %times% ==1 set %letter%%times%=.&& set num1=o&& goto message1
if %times% ==2 set %letter%%times%=.&& set num2=o&& goto message2
if %times% ==3 set %letter%%times%=.&& set num2=o&& goto message2
if %times% ==4 set %letter%%times%=.&& set num3=o&& goto message3
if %times% ==5 set %letter%%times%=.&& set num3=o&& goto message3
if %times% ==6 set %letter%%times%=.&& set num4=o&& goto message4
if %times% ==7 set %letter%%times%=.&& set num4=o&& goto message4
if %times% ==8 set %letter%%times%=.&& set num5=o&& goto message3
if %times% ==9 set %letter%%times%=.&& set num5=o&& goto message3
if %times% ==10 set %letter%%times%=.&& set num6=o&& goto message2
if %times% ==11 set %letter%%times%=.&& set num6=o&& goto message2
if %times% ==12 set %letter%%times%=.&& set num7=o&& goto message1
exit

:message1
cls
set message=Your bet doubled 8x!
set /a betchoice=%choice%
set /a betchoice*=8
set /a money+=%betchoice%
set preview=y
goto render

:message2
cls
set message=Your bet doubled 5x!
set /a betchoice=%choice%
set /a betchoice*=5
set /a money+=%betchoice%
set preview=y
goto render

:message3
cls
set message=Your bet doubled 3x!
set /a betchoice=%choice%
set /a betchoice*=3
set /a money+=%betchoice%
set preview=y
goto render

:message4
cls
set message=You lost a heart!
set /a heart-=1
set preview=y
goto render

::::::::::::::END_OF_RANDOM_BALL_MOVEMENT:::::::::::::::

::::::::::::::::::::BALL_RENDERING::::::::::::::::::::::
:render
cls
@mode 35,24
echo.
echo   +==========+
echo   I Heart: %heart% I Money: $%money%
echo   +=============================+
echo   I                             I
echo   I              _              I
echo   I             /%a1%\             I
echo   I            /%b1%*%b2%\            I
echo   I           /%c1%*%c2%*%c3%\           I
echo   I          /%d1%*%d2%*%d3%*%d4%\          I
echo   I         /%e1%*%e2%*%e3%*%e4%*%e5%\         I
echo   I        /%f1%*%f2%*%f3%*%f4%*%f5%*%f6%\        I
echo   I       /%g1%*%g2%*%g3%*%g4%*%g5%*%g6%*%g7%\       I
echo   I      /%h1%*%h2%*%h3%*%h4%*%h5%*%h6%*%h7%*%h8%\      I
echo   I     /%i1%*%i2%*%i3%*%i4%*%i5%*%i6%*%i7%*%i8%*%i9%\     I
echo   I    /%j1%*%j2%*%j3%*%j4%*%j5%*%j6%*%j7%*%j8%*%j9%*%j10%\    I
echo   I   /%k1%*%k2%*%k3%*%k4%*%k5%*%k6%*%k7%*%k8%*%k9%*%k10%*%k11%\   I
echo   I  /%l1%*%l2%*%l3%*%l4%*%l5%*%l6%*%l7%*%l8%*%l9%*%l10%*%l11%*%l12%\  I
echo   I  I%num1%I %num2% I %num3% I %num4% I %num5% I %num6% I%num7%I  I
echo   I  -------------------------  I
echo   +=============================+
echo   I Info: %message%
echo   +=============================+
ping localhost /n 2 >nul
if %preview% ==y set preview=n&& goto setnull
goto betping

:::::::::::::END_OF_BALL_RENDERING::::::::::::::::::::::::

:::::::::::::RESET_BALL:::::::::::::::::::::::::::::::::::

:setnull
cls
set a1=o
set num1=8
set num2=5
set num3=3
set num4=X
set num5=3
set num6=5
set num7=8
set choice=.
set message=Enter "Q" to leave.
goto ChoiceView

:::::::::::::::::END_OF_RESET_BALL:::::::::::::::::::::::::::

:::::::::::::::::SPECIAL_CUTSCENE::::::::::::::::::::::::::::
:: NOW I KNOW YOU WANT TO THIS SO BADLY BUT I REQUEST YOU
:: DONT DO IT!

:Ask_Window
cls
@mode 50,14
echo.
echo   +=======================================+
echo   I                                       I
echo   I            SPECIAL CUTSCENE           I
echo   I                                       I
echo   I   DO YOU WANT TO VIEW THE SPECIAL     I
echo   I               CUTSCENE?               I
echo   I                (y/n)                  I
echo   I                                       I
echo   +=======================================+
echo   I  MAX THE HIGHSCORE AND GET A SPECIAL  I
echo   I  CUTSCENE AND THING FROM THE DEV....  I
echo   +=======================================+
choice /c:yn >nul
if %ERRORLEVEL% ==1 goto Special_Cutscene
if %ERRORLEVEL% ==2 goto GraphicsForBall
exit

:Special_Cutscene
cls
@mode 50,14
echo.
echo   +=======================================+
echo   I               ___________              \
echo   I              -HEARTS MODE-              \
echo   I                                          \#/
echo   I  HIGHSCORE: 9-----------------------C
echo   I                                          /#\
echo   I                                         /
echo   I                                        /
echo   +=======================================+
echo   I  MAX THE HIGHSCORE AND GET A SPECIAL  I
echo   I  CUTSCENE AND THING FROM THE DEV....  I
echo   +=======================================+
ping localhost /n 2 >nul
cls
echo.
echo   +=======================================+
echo   I               ___________              \
echo   I              -HEARTS MODE-              \
echo   I                                          \#/
echo   I  HIGHSCORE: 99-----------------------C
echo   I                                          /#\
echo   I                                         /
echo   I                                        /
echo   +=======================================+
echo   I  MAX THE HIGHSCORE AND GET A SPECIAL  I
echo   I  CUTSCENE AND THING FROM THE DEV....  I
echo   +=======================================+
ping localhost /n 2 >nul
cls
echo.
echo   +=======================================+
echo   I               ___________              \
echo   I              -HEARTS MODE-              \
echo   I                                          \#/
echo   I  HIGHSCORE: 999-----------------------C
echo   I                                          /#\
echo   I                                         /
echo   I                                        /
echo   +=======================================+
echo   I  MAX THE HIGHSCORE AND GET A SPECIAL  I
echo   I  CUTSCENE AND THING FROM THE DEV....  I
echo   +=======================================+
ping localhost /n 2 >nul
cls
echo.
echo   +=======================================+
echo   I               ___________              \
echo   I              -HEARTS MODE-              \
echo   I                                          \#/
echo   I  HIGHSCORE: 9999-----------------------C
echo   I                                          /#\
echo   I                                         /
echo   I                                        /
echo   +=======================================+
echo   I  MAX THE HIGHSCORE AND GET A SPECIAL  I
echo   I  CUTSCENE AND THING FROM THE DEV....  I
echo   +=======================================+
ping localhost /n 2 >nul
cls
echo.
echo   +=======================================+
echo   I               ___________              \
echo   I              -HEARTS MODE-              \
echo   I                                          \#/
echo   I  HIGHSCORE: 99999-----------------------C
echo   I                                          /#\
echo   I                                         /
echo   I                                        /
echo   +=======================================+
echo   I  MAX THE HIGHSCORE AND GET A SPECIAL  I
echo   I  CUTSCENE AND THING FROM THE DEV....  I
echo   +=======================================+
ping localhost /n 2 >nul
cls
echo.
echo   +=======================================+
echo   I               ___________              \
echo   I              -HEARTS MODE-              \
echo   I                                          \#/
echo   I  HIGHSCORE: 999999-----------------------C
echo   I                                          /#\
echo   I                                         /
echo   I                                        /
echo   +=======================================+
echo   I  MAX THE HIGHSCORE AND GET A SPECIAL  I
echo   I  CUTSCENE AND THING FROM THE DEV....  I
echo   +=======================================+
ping localhost /n 2 >nul
cls
echo.
echo   +=======================================+
echo   I               ___________              \
echo   I              -HEARTS MODE-              \
echo   I                                          \#/
echo   I  HIGHSCORE: 9999999-----------------------C
echo   I                                          /#\
echo   I                                         /
echo   I                                        /
echo   +=======================================+
echo   I  MAX THE HIGHSCORE AND GET A SPECIAL  I
echo   I  CUTSCENE AND THING FROM THE DEV....  I
echo   +=======================================+
ping localhost /n 2 >nul
cls
echo.
echo   +=======================================+
echo   I               ___________              \
echo   I              -HEARTS MODE-              \
echo   I                                          \#/
echo   I  HIGHSCORE: 99999999-----------------------C
echo   I                                          /#\
echo   I                                         /
echo   I                                        /
echo   +=======================================+
echo   I  MAX THE HIGHSCORE AND GET A SPECIAL  I
echo   I  CUTSCENE AND THING FROM THE DEV....  I
echo   +=======================================+
ping localhost /n 2 >nul
cls
echo.
echo   +=======================================+
echo   I               ___________              \
echo   I              -HEARTS MODE-              \
echo   I                                          \#/
echo   I  HIGHSCORE: 999999999-----------------------C
echo   I                                          /#\
echo   I                                         /
echo   I                                        /
echo   +=======================================+
echo   I  MAX THE HIGHSCORE AND GET A SPECIAL  I
echo   I  CUTSCENE AND THING FROM THE DEV....  I
echo   +=======================================+
ping localhost /n 2 >nul
cls
echo.
echo      +=======================================+
echo     /                                        I
echo    /               -PROMO CODE-              I
echo \#/                                          I
echo ------------C   CODE: LOYALGAMER             I
echo /#\                                          I
echo    \  USE THIS IN THE NEXT UPDATE TO MAX OUT I
echo     \        THE UPGRADES NEXT UPDATE!       I
echo      +=======================================+
pause >nul
goto start

:::::::::::::::::::END_OF_SPECIAL_CUTSCENE::::::::::::::::::::::::::