;ohboy's tsum tsum heart send bot
;v0.012b
;pre-configured for width = 1000, height = 800
#Persistent


Start:

Width := 1000
Height := 800
Xcoord := 0
Ycoord := 0


claimfrequency := 200


heartmailx := 640
heartmaily := 180
heartclaimx := 580
heartclaimy := 600
heartconfirmx := 580
heartconfirmy := 460
heartokx := 500
heartoky := 600
heartclosex := 500
heartclosey := 700


collect1x := 650
collect1y := 295
collect2x := 650
collect2y := 375
collect3x := 650 
collect3y := 460
collect4x := 650 
collect4y := 540

confirmsendx := 585
confirmsendy := 465
confirmphantom1x := 500
confirmphantom1y := 690
confirmphantom2x := 500
confirmphantom2y := 610

dragstartx := 500
dragstarty := 560
dragendx := 500
dragendy := 350
dragendx2 := 500
dragendy2 := 470
dragendx3 := 500
dragendy3 := 540

imagestartgame := "imagestartgame.bmp"
startgamex1 := 400
startgamey1 := 640
startgamex2 := 470
startgamey2 := 690

imagecloseevents := "imagecloseevents.bmp"
closeeventsx1 := 400
closeeventsy1 := 640
closeeventsx2 := 600
closeeventsy2 := 740

imagehearts := "imagehearts.bmp"
heartsx1 := 600
heartsy1 := 250
heartsx2 := 690
heartsy2 := 575

imageokhearts := "imageokhearts.bmp"
okheartsx1 := 530
okheartsy1 := 435
okheartsx2 := 640
okheartsy2 := 485

imageheartsent := "imageheartsent.bmp"
heartsentx1 := 400
heartsenty1 := 335
heartsentx2 := 590
heartsenty2 := 430

imageranking := "imageranking.bmp"
rankingx1 := 380
rankingy1 := 200
rankingx2 := 570
rankingy2 := 265

imageinbox :=
inboxx1 :=
inboxy1 :=
inboxx2 :=
inboxy2 :=

imageclaimall := "claimall.bmp"
claimallx1 := 500
claimally1 := 575
claimallx2 := 675
claimally2 := 630

imagereceiveok := "receiveok.bmp"
receiveokx1 := 500
receiveoky1 := 430
receiveokx2 := 660
receiveoky2 := 490

imagereceiveclose := "receiveclose.bmp"
receiveclosex1 := 400
receiveclosey1 := 550
receiveclosex2 := 580
receiveclosey2 := 645


imageendoflist := "imageendoflist.bmp"
endoflistx1 := 345
endoflisty1 := 280
endoflistx2 := 410
endoflisty2 := 560

imageback := "imageback.bmp"
backx1 := 290
backy1 := 645
backx2 := 410
backy2 := 740

imagedc := "imagedc.bmp"
dcx1 := 410
dcy1 := 545
dcx2 := 585
dcy2 := 640

imagefirst := "imagefirst.bmp"
firstx1 := 320
firsty1 := 250
firstx2 := 390
firsty2 := 710

imagecloseinvite := "imagecloseinvite.bmp"
closeinvitex1 := 290
closeinvitey1 := 640
closeinvitex2 := 510
closeinvitey2 := 750

imagecollectindiv := "imagecollectindiv.bmp"
collectindivx1 := 570
collectindivy1 := 230
collectindivx2 := 680
colelctindivy2 := 580

imagecollectend := "imagecollectend.bmp"
collectendx1 := 320
collectendy1 := 450
collectendx2 := 590
collectendy2 := 570

imagedisney := "imagedisney.bmp"
disneyx1 := 320
disneyy1 := 230
disneyx2 := 430
disneyy2 := 575

imageunknown := "imageunknown.bmp"
unknownx1 := 320
unknowny1 := 230
unknownx2 := 430
unknowny2 := 575

imagereceivegift := "imagereceivegift.bmp"
receivegiftx1 := 520
receivegifty1 := 545
receivegiftx2 := 655
receivegifty2 := 500

imageheartreceived := "imageheartreceived.bmp"
heartreceivedx1 := 420
heartreceivedy1 := 360
heartreceivedx2 := 580
heartreceivedy2 := 430




sleepdelay := 100
bottomx := 500
bottomy := 750

inboxdragstartx := 500
inboxdragstarty := 560
inboxdragendx := 500
inboxdragendy := 370


F10::
Pause




F12::
#p::

dragcount := 0
CoordMode, Pixel, Client  ; use client instead of relative settings
CoordMode, Mouse, Client  ; use client instead of relative settings
ResizeWin(Xcoord,Ycoord,Width,Height)
Sleep 3000

StartRun:


Gosub, ErrorCheck




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Main logic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;Search for hearts
ImageSearch, FoundX, Foundy, heartsx1,heartsy1,heartsx2,heartsy2,*200 %A_ScriptDir%\images\%imagehearts%
if(ErrorLevel=0){ ; found the image
	Random x, FoundX, FoundX+10
	Random y, FoundY, FoundY+10
	MouseMove , x,y,0
	MouseClick,Left,x,y	
	Sleep, %sleepdelay%
}



;Search for hearts ok button
ImageSearch, FoundX, Foundy, okheartsx1,okheartsy1,okheartsx2,okheartsy2,*150 %A_ScriptDir%\images\%imageokhearts%
if(ErrorLevel=0){ ; found the image
	Random x, FoundX, FoundX+10
	Random y, FoundY, FoundY+10
	MouseMove , x,y,0
	MouseClick,Left,x,y	
	Sleep, %sleepdelay%
}

;Search for hearts sent notification
ImageSearch, FoundX, Foundy, heartsentx1,heartsenty1,heartsentx2,heartsenty2,*150 %A_ScriptDir%\images\%imageheartsent%
if(ErrorLevel=0){ ; found the image
	Random x, FoundX, FoundX+10
	Random y, FoundY, FoundY+10
	MouseMove , bottomx,bottomy,0
	;MouseClick,Left,x,y	
	MouseClick,Left,bottomx,bottomy
	Sleep, %sleepdelay%
}

;Search for no hearts
ImageSearch, FoundX, Foundy, heartsx1,heartsy1,heartsx2,heartsy2,*200 %A_ScriptDir%\images\%imagehearts%
if(ErrorLevel=1){ ; didn't find the image
	;no hearts found, look for ranking page to make sure we're on right page
	ImageSearch, FoundX, Foundy,rankingx1,rankingy1,rankingx2,rankingy2,*200 %A_ScriptDir%\images\%imageranking%
	if(ErrorLevel=0){
		ImageSearch, FoundX, Foundy, endoflistx1,endoflisty1,endoflistx2,endoflisty2,*150 %A_ScriptDir%\images\%imageendoflist%
			if(ErrorLevel=1){ ; found the image	
			DragUp2(dragstartx,dragstarty,dragendx,dragendy)
			dragcount++
			Sleep, %sleepdelay%
		}

	}
}


;Check mailbox every few drags
if(dragcount>=claimfrequency){
	dragcount:=0 ; reset dragcount
	CollectHearts(heartmailx,heartmaily,heartclaimx,heartclaimy,heartconfirmx,heartconfirmy,heartokx,heartoky,heartclosex,heartclosey)
	Sleep, %sleepdelay%
}


;Search for end of list
ImageSearch, FoundX, Foundy, endoflistx1,endoflisty1,endoflistx2,endoflisty2,*150 %A_ScriptDir%\images\%imageendoflist%
if(ErrorLevel=0){ ; found the image	
	;Search for no hearts again
	ImageSearch, FoundX, Foundy, heartsx1,heartsy1,heartsx2,heartsy2,*200 %A_ScriptDir%\images\%imagehearts%
	if(ErrorLevel=1){ ; didn't find the image
		;no hearts found, back to the top
		
		KeepDragging:
		DragToTop(1)
		ImageSearch, FoundX, Foundy, firstx1,firsty1,firstx2,firsty2,*150 %A_ScriptDir%\images\%imagefirst%
		if(ErrorLevel=1){ ; first not on top yet
			Gosub, ErrorCheck ; check for errors
			Goto, KeepDragging
			
		}
		;MsgBox "SleepStart"
		Sleep 10000
		;MsgBox "SleepEnd"
		CollectHearts(heartmailx,heartmaily,heartclaimx,heartclaimy,heartconfirmx,heartconfirmy,heartokx,heartoky,heartclosex,heartclosey)
		Sleep 5000
			

		dragcount:=0 ; reset dragcount
		
		;wait for heart to be found before continue
		;Waiting:
		;ImageSearch, FoundX, Foundy, heartsx1,heartsy1,heartsx2,heartsy2,*200 %A_ScriptDir%\images\%imagehearts%
		;if(ErrorLevel=1){ ; didn't find hearts
		;	Sleep 30000 ; check every 10 seconds
		;	CollectHearts(heartmailx,heartmaily,heartclaimx,heartclaimy,heartconfirmx,heartconfirmy,heartokx,heartoky,heartclosex,heartclosey)
		;	Gosub, ErrorCheck ; check for errors
		;	Goto, Waiting ; let's wait some more
		;}
		
		
	}
}





Goto, StartRun








;drag to top of screen
DragToTop(count){
	Loop, %count%{
		MouseMove , 500,300,0
		MouseClickDrag, left, 500, 300, 500, 700 , 2
		
	}
}



;collect hearts
CollectHearts(Heartmailx,Heartmaily,Heartclaimx,Heartclaimy,Heartconfirmx,Heartconfirmy,Heartokx,Heartoky,Heartclosex,Heartclosey){
	Sleep 3000
	MouseMove , heartmailx,heartmaily,0
	MouseClick,Left,heartmailx,heartmaily	; Click check mail button
	Gosub, ClaimUnknown
	Sleep 5000

	;MouseClick,Left,Heartclaimx,Heartclaimy	; Click collect all button
	;Sleep 2000

	;MouseClick,Left,Heartconfirmx,Heartconfirmy ; Click confirm button
	;Sleep 2000	
	
	;MouseClick,Left,Heartokx,Heartoky	; Click OK button
	;Sleep 2000

	;MouseClick,Left,Heartclosex,Heartclosey ; Click Close button
	;Sleep 2000
}


;drag the screen up to prepare for next 4 hearts
DragUp2(Dragstartx,Dragstarty,Dragendx,Dragendy){
	CoordMode, Mouse, Client  ; use client instead of relative settings
	MouseMove , Dragstartx+20,Dragstarty+20,0
	MouseClickDrag, left, Dragstartx, Dragstarty, Dragendx, Dragendy,3 
	Sleep 500
}	




;for testing only. Displays text
disp(text){
	Gui, Destroy
	Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption
	Gui, Color, ffffff ;changes background color
	Gui, Font, 000000 s10 wbold, Verdana ;changes font color, size and font
	Gui, Add, Text, x0 y0, %text% ;the text to display
	Gui, Show, NoActivate, X0, Y0


}






ErrorCheck:
; check for errors first

; Search for team viewer pop up
IfWinExist, Sponsored session
{
	ControlClick, Button4, Sponsored session
	Sleep 1000
	
	
	
}

IfWinNotActive, Bluestacks App Player
{
		WinActivate, Bluestacks App Player
}



; Search for heart claim all button
ImageSearch, FoundX, Foundy, claimallx1,claimally1,claimallx2,claimally2,*200 %A_ScriptDir%\images\%imageclaimall%
if(ErrorLevel=0){ ; found the image
	Random x, FoundX, FoundX+10
	Random y, FoundY, FoundY+10
	MouseMove , x,y,0
	MouseClick,Left,x,y
	Sleep, %sleepdelay%
	;Sleep 500
}


;Search for claim receive ok
ImageSearch, FoundX, Foundy, receiveokx1,receiveoky1,receiveokx2,receiveoky2,*150 %A_ScriptDir%\images\%imagereceiveok%
if(ErrorLevel=0){ ; found the image
	Random x, FoundX, FoundX+10
	Random y, FoundY, FoundY+10
	MouseMove , x,y,0
	MouseClick,Left,x,y
	Sleep, %sleepdelay%
}


;Search for back button(accidental play)
ImageSearch, FoundX, Foundy, backx1,backy1,backx2,backy2,*150 %A_ScriptDir%\images\%imageback%
if(ErrorLevel=0){ ; found the image
	Random x, FoundX, FoundX+10
	Random y, FoundY, FoundY+10
	MouseMove , x,y,0
	MouseClick,Left,x,y
	Sleep, %sleepdelay%
}


;Search for disconnect(play again)
ImageSearch, FoundX, Foundy, dcx1,dcy1,dcx2,dcy2,*150 %A_ScriptDir%\images\%imagedc%
if(ErrorLevel=0){ ; found the image
	Random x, FoundX, FoundX+10
	Random y, FoundY, FoundY+10
	MouseMove , x,y,0
	MouseClick,Left,x,y
	Sleep, %sleepdelay%
}






;Search for Start Game Button

ImageSearch, FoundX, FoundY, startgamex1,startgamey1,startgamex2,startgamey2,*150 %A_ScriptDir%\images\%imagestartgame%
if(ErrorLevel=0){ ; found the image
	Random x, FoundX, FoundX+10
	Random y, FoundY, FoundY+10
	MouseMove , x,y,0
	MouseClick,Left,x,y	
	Sleep, %sleepdelay%
}



;Search for Events Button
ImageSearch, FoundX, Foundy, closeeventsx1,closeeventsy1,closeeventsx2,closeeventsy2,*150 %A_ScriptDir%\images\%imagecloseevents%
if(ErrorLevel=0){ ; found the image
	Random x, FoundX, FoundX+10
	Random y, FoundY, FoundY+10
	MouseMove , x,y,0
	MouseClick,Left,x,y	
	Sleep, %sleepdelay%
}

;Search for hearts ok button
ImageSearch, FoundX, Foundy, okheartsx1,okheartsy1,okheartsx2,okheartsy2,*150 %A_ScriptDir%\images\%imageokhearts%
if(ErrorLevel=0){ ; found the image
	Random x, FoundX, FoundX+10
	Random y, FoundY, FoundY+10
	MouseMove , x,y,0
	MouseClick,Left,x,y	
	Sleep, %sleepdelay%
}

;Search for hearts sent notification
ImageSearch, FoundX, Foundy, heartsentx1,heartsenty1,heartsentx2,heartsenty2,*200 %A_ScriptDir%\images\%imageheartsent%
;disp(ErrorLevel)
if(ErrorLevel=0){ ; found the image
	Random x, FoundX, FoundX+10
	Random y, FoundY, FoundY+10
	MouseMove , bottomx,bottomy,0
	;MouseClick,Left,x,y	
	MouseClick,Left,bottomx,bottomy
	Sleep, %sleepdelay%
}

;Search for close invitation menu button
ImageSearch, FoundX, Foundy, closeinvitex1,closeinvitey1,closeinvitex2,closeinvitey2,*150 %A_ScriptDir%\images\%imagecloseinvite%
if(ErrorLevel=0){ ; found the image
	Random x, FoundX+50, FoundX+60
	Random y, FoundY+20, FoundY+30
	MouseClick,Left,x,y	
	Sleep, %sleepdelay%
}



return







#d::
ClaimUnknown:
Sleep, 5000
Loop{
	;Search for ok button
	ImageSearch, FoundX, Foundy, receiveokx1,receiveoky1,receiveokx2,receiveoky2,*150 %A_ScriptDir%\images\%imagereceiveok%
	;MsgBox %ErrorLevel%
	if(ErrorLevel=0){ ; found the image
		Random x, FoundX, FoundX+10
		Random y, FoundY, FoundY+10
		MouseMove , x,y,0
		MouseClick,Left,x,y	
		Sleep, %sleepdelay%
	}	
	;Search for received confirmation
	ImageSearch, FoundX, Foundy, heartreceivedx1,heartreceivedy1,heartreceivedx2,heartreceivedy2,*200 %A_ScriptDir%\images\%imageheartreceived%
	;MsgBox %ErrorLevel%
	if(ErrorLevel=0){ ; found the image
		MouseMove , bottomx,bottomy,0
		MouseClick,Left,bottomx,bottomy
		Sleep, %sleepdelay%
	}
	;Search for unknowns
	ImageSearch, FoundX, Foundy, unknownx1,unknowny1,unknownx2,unknowny2,*150 %A_ScriptDir%\images\%imageunknown%
	;MsgBox %ErrorLevel%
	if(ErrorLevel=0){ ; found the image
		Random x, FoundX+250, FoundX+260
		Random y, FoundY, FoundY+10
		MouseMove , x,y,0
		MouseClick,Left,x,y	
		Sleep, %sleepdelay%
	}	
	if(ErrorLevel=1){ ; no image found, scroll down
		MouseMove , inboxdragstartx+20,inboxdragstarty+20,0
		MouseClickDrag, left, inboxdragstartx, inboxdragstarty, inboxdragendx, inboxdragendy,5 
		
	}
	if(ErrorLevel=1){
		;Search for bottom
		ImageSearch, FoundX, Foundy, collectendx1,collectendy1,collectendx2,collectendy2,*50 %A_ScriptDir%\images\%imagecollectend%
		if(ErrorLevel=0){ ; found the image
			;MsgBox "bottom found"
			return
		}	
	}
	
	
}	
MsgBox "Fail"
return	












ResizeWin(X = 0,Y = 0,W = 0,H = 0)
{
  ;WinActivate BlueStacks App Player	
  WinGetPos,X1,Y1,W1,H1,A

  ;SetTitleMatchMode Slow
  ;SetTitleMatchMode 2	

  WinMove,A,,%X%,%Y%,%W%,%H%

  WinGetPos,X2,Y2,W2,H2,A
  ;MsgBox  "Old Width was %W1%"
  ;MsgBox  " New Width is %W2%"
  ;MsgBox  "Old Height was %H1%"
  ;MsgBox  " New Height is %H2%"
}








Esc::
Gui, Destroy
ExitApp  ;Escape key will exit