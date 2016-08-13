;ohboy's tsum tsum heart send bot
;pre-configured for width = 1000, height = 700
;v0.009b
#Persistent

Start:

Width := 1000
Height := 700
Xcoord := 0
Ycoord := 0


claimfrequency := 100


heartmailx := 620
heartmaily := 170
heartclaimx := 570
heartclaimy := 530
heartconfirmx := 570
heartconfirmy := 400
heartokx := 500
heartoky := 520
heartclosex := 500
heartclosey := 600



dragstartx := 500
dragstarty := 490
dragendx := 500
dragendy := 320


imagestartgame := "imagestartgame.bmp"
startgamex1 := 390
startgamey1 := 550
startgamex2 := 630
startgamey2 := 630

imagecloseevents := "imagecloseevents.bmp"
closeeventsx1 := 400
closeeventsy1 := 560
closeeventsx2 := 600
closeeventsy2 := 650

imagehearts := "imagehearts.bmp"
heartsx1 := 600
heartsy1 := 230
heartsx2 := 660
heartsy2 := 500

imageokhearts := "imageokhearts.bmp"
okheartsx1 := 520
okheartsy1 := 385
okheartsx2 := 630
okheartsy2 := 435

imageheartsent := "imageheartsent.bmp"
heartsentx1 := 430
heartsenty1 := 325
heartsentx2 := 570
heartsenty2 := 390

imageranking := "imageranking.bmp"
rankingx1 := 420
rankingy1 := 180
rankingx2 := 560
rankingy2 := 235

imageinbox :=
inboxx1 :=
inboxy1 :=
inboxx2 :=
inboxy2 :=

imageclaimall := "imageclaimall.bmp"
claimallx1 := 500
claimally1 := 500
claimallx2 := 650
claimally2 := 550

imagereceiveok := "imagereceiveok.bmp"
receiveokx1 := 520
receiveoky1 := 380
receiveokx2 := 620
receiveoky2 := 430

imageendoflist := "imageendoflist.bmp"
endoflistx1 := 360
endoflisty1 := 280
endoflistx2 := 420
endoflisty2 := 500

imageback := "imageback.bmp"
backx1 := 310
backy1 := 560
backx2 := 440
backy2 := 655

imagedc := "imagedc.bmp"
dcx1 := 410
dcy1 := 470
dcx2 := 590
dcy2 := 570

imagefirst := "imagefirst.bmp"
firstx1 := 330
firsty1 := 220
firstx2 := 400
firsty2 := 470


sleepdelay := 100
bottomx := 500
bottomy := 680



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
	ImageSearch, FoundX, Foundy,rankingx1,rankingy1,rankingx2,rankingy2,*175 %A_ScriptDir%\images\%imageranking%
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
ImageSearch, FoundX, Foundy, endoflistx1,endoflisty1,endoflistx2,endoflisty2,*200 %A_ScriptDir%\images\%imageendoflist%
if(ErrorLevel=0){ ; found the image	
	;Search for no hearts again
	ImageSearch, FoundX, Foundy, heartsx1,heartsy1,heartsx2,heartsy2,*200 %A_ScriptDir%\images\%imagehearts%
	if(ErrorLevel=1){ ; didn't find the image
		;no hearts found, back to the top
		
		KeepDragging:
		DragToTop(1)
		ImageSearch, FoundX, Foundy, firstx1,firsty1,firstx2,firsty2,*125 %A_ScriptDir%\images\%imagefirst%
		if(ErrorLevel=1){ ; first not on top yet
			Gosub, ErrorCheck ; check for errors
			Goto, KeepDragging
			
		}
		Sleep 15000
		CollectHearts(heartmailx,heartmaily,heartclaimx,heartclaimy,heartconfirmx,heartconfirmy,heartokx,heartoky,heartclosex,heartclosey)
		
			

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
		MouseClickDrag, left, 500, 240, 500, 550 , 2
		
	}
}



;collect hearts
CollectHearts(Heartmailx,Heartmaily,Heartclaimx,Heartclaimy,Heartconfirmx,Heartconfirmy,Heartokx,Heartoky,Heartclosex,Heartclosey){
	;Sleep 3000
	MouseMove , heartmailx,heartmaily,0
	MouseClick,Left,heartmailx,heartmaily	; Click check mail button


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
;MsgBox %ErrorLevel%
if(ErrorLevel=0){ ; found the image
	Random x, FoundX, FoundX+10
	Random y, FoundY, FoundY+10
	MouseMove , x,y,0
	MouseClick,Left,x,y
	Sleep, %sleepdelay%
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
ImageSearch, FoundX, Foundy, heartsentx1,heartsenty1,heartsentx2,heartsenty2,*150 %A_ScriptDir%\images\%imageheartsent%
if(ErrorLevel=0){ ; found the image
	Random x, FoundX, FoundX+10
	Random y, FoundY, FoundY+10
	MouseMove , bottomx,bottomy,0
	MouseClick,Left,x,y	
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

