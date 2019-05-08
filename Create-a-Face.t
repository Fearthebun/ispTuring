%Nayaab Ali
%June 8, 2018
%Ms Krasteva
%Will output a program that allows the user to create a face

%Import
import GUI

forward procedure instructions
forward procedure mainMenu

%Declaration section
var menuButton, quitButton, playButton, instructButton, doneButton : int := 0
var faceShape : int
var mainWin := Window.Open ("position:600;500, graphics:640;400")
var item : array 1 .. 24 of int
var itemName : array 1 .. 24 of string (20) := init ("Round Light Skin", "Round Dark Skin", "Oval Light Skin", "Oval Dark Skin", "Blue Eyes", "Closed Eyes", "Green Eyes", "Round Nose", "Arc Nose", "Smile", "Grin", "Frown", "Sad", "Open", "Straight", "Upwards", "Downwards", "Dark Short Hair", "Light Short Hair", "Dark Buns", "Light Buns", "Small", "Large", "Square")
var face, eyes, nose, mouth, eyebrows, hair, ears : int
var faceColour : int := 0
var finished : boolean := false
var displayWin : int := 0


%Plays music
process doMusic
    loop
	exit when finished = true
	Music.PlayFile ("Mii Channel Music.mp3") %plays music file
    end loop
end doMusic

%Program title
procedure title
    cls
    locate (1, 33) %centers it
    put "Create-a-Face!"
end title

%Program introduction
procedure introduction
    title
    fork doMusic
    locate (4, 28)
    put "Welcome to Create-A-Face!"
    locate (6, 4)
    put "With this program, you can design your very own face with a large selection"
    locate (7, 12)
    put "of options. Round faces, happy faces, sad faces, all the"
    locate (8, 15)
    put "faces you could imagine! It's all up to you. Enjoy!"
    locate (21, 16)
    put "Please press the button to continue to the main menu."
    menuButton := GUI.CreateButton (277, 30, 0, "Main menu", mainMenu) %button leads to main menu
    
    for manyjump : 0 .. 1
	for jump : 0 .. 30
	    drawfillbox (285, 89, 355, 194 + jump, white) %erase
    
	    Draw.ThickLine (320, 135 + jump, 320, 100 + jump, 3, black) %body
	    Draw.ThickLine (320, 100 + jump, 310, 90 + jump, 3, black) %left leg
	    Draw.ThickLine (320, 100 + jump, 330, 90 + jump, 3, black) %right leg
    
	    Draw.ThickLine (320, 110 + jump, 310, 118 + jump, 3, black) %hand left
	    Draw.ThickLine (320, 110 + jump, 330, 118 + jump, 3, black) %hand right
    
	    drawfilloval (320, 160 + jump, 35, 35, black) %head outer
	    drawfilloval (320, 160 + jump, 31, 31, 0) %head inside
    
	    drawfilloval (310, 175 + jump, 3, 3, black) %eye left
	    drawfilloval (330, 175 + jump, 3, 3, black) %eye left
    
	    drawarc (320, 170 + jump, 4, 4, 180, 0, black) %mouth
	    delay (20)
	end for
    
	for jump : 0 .. 30
	    drawfillbox (285, 89, 355, 226 - jump, white) %erase
    
	    Draw.ThickLine (320, 165 - jump, 320, 130 - jump, 3, black) %body
	    Draw.ThickLine (320, 130 - jump, 310, 120 - jump, 3, black) %left leg
	    Draw.ThickLine (320, 130 - jump, 330, 120 - jump, 3, black) %right leg
    
	    Draw.ThickLine (320, 140 - jump, 310, 148 - jump, 3, black) %hand left
	    Draw.ThickLine (320, 140 - jump, 330, 148 - jump, 3, black) %hand right
    
	    drawfilloval (320, 190 - jump, 35, 35, black) %head outer
	    drawfilloval (320, 190 - jump, 31, 31, 0) %head inside
    
	    drawfilloval (310, 205 - jump, 3, 3, black) %eye left
	    drawfilloval (330, 205 - jump, 3, 3, black) %eye left
    
	    drawarc (320, 200 - jump, 4, 4, 180, 0, black) %mouth
	    delay (20)
	end for
    end for
end introduction

%Program exit message
procedure goodbye
    Window.Select (mainWin)
    title
    locate (10, 22)
    put "Thanks for playing, come again soon!"
    locate (12, 26)
    put "Brought to you by Nayaab Ali"
    drawfilloval (300, 150, 5, 5, black) %left eye
    drawfilloval (340, 150, 5, 5, black) %right eye
    drawarc (320, 140, 5, 5, 0, 180, black) %mouth
    delay (1500)
    Window.Close (mainWin)
end goodbye

%Draws light small face
procedure drawFace1
    drawfillarc (320, 270, 115, 65, 0, 180, 0) %hair erase
    drawfilloval (320, 185, 130, 150, 0) %erase
    
    faceColour := 90
    drawfilloval (320, 200, 130, 130, faceColour)
end drawFace1

%Draws dark small face
procedure drawFace2
    drawfillarc (320, 270, 115, 65, 0, 180, 0) %hair erase
    drawfilloval (320, 185, 130, 150, 0) %erase

    RGB.SetColour (91, 0.9, 0.59, 0.32) %sets specifically coloured skin tone
    faceColour := 91
    drawfilloval (320, 200, 130, 130, faceColour)
end drawFace2

%Draws light large face
procedure drawFace3
    drawfillarc (320, 270, 115, 65, 0, 180, 0) %hair erase
    drawfilloval (320, 200, 130, 130, 0) %erase

    faceColour := 90
    drawfilloval (320, 190, 130, 140, faceColour)
end drawFace3

%Draws dark large face
procedure drawFace4
    drawfillarc (320, 270, 115, 65, 0, 180, 0) %hair erase
    drawfilloval (320, 200, 130, 130, 0) %erase

    RGB.SetColour (91, 0.9, 0.59, 0.32) %sets specifically coloured skin tone
    faceColour := 91
    drawfilloval (320, 190, 130, 140, faceColour)
end drawFace4

%Draws blue eyes
procedure drawEyes1 
    drawfilloval (370, 230, 16, 16, white) %right eye
    drawfilloval (370, 230, 10, 10, 32)

    drawfilloval (270, 230, 16, 16, white) %left eye
    drawfilloval (270, 230, 10, 10, 32)
end drawEyes1

%Draws happy closed eyes
procedure drawEyes2
    drawfilloval (370, 230, 16, 16, faceColour) %right eye erase
    drawfilloval (270, 230, 16, 16, faceColour) %left eye erase

    for eye : 0 .. 4
    drawarc (370, 230 - eye, 13, 13, 0, 180, black) %right eye
    
    drawarc (270, 230 - eye, 13, 13, 0, 180, black) %left eye
    end for
end drawEyes2

%Draws green eyes
procedure drawEyes3
    drawfilloval (370, 230, 16, 16, white) %right eye
    drawfilloval (370, 230, 10, 10, 141)

    drawfilloval (270, 230, 16, 16, white) %left eye
    drawfilloval (270, 230, 10, 10, 141)
end drawEyes3

%Draws round nose
procedure drawNose1
    drawfilloval (322, 190, 13, 13, faceColour) %erase
    drawfilloval (322, 190, 13, 13, 40)
end drawNose1

%Draws arc nose
procedure drawNose2
    drawfilloval (322, 190, 13, 13, faceColour) %erase
    drawarc (322, 190, 13, 13, 270, 90, black)
end drawNose2

%Draws happy mouth
procedure drawMouth1
    drawfillbox (300, 100, 345, 170, faceColour) %erase
    drawarc (322, 150, 20, 20, 180, 0, black)
end drawMouth1

%Draws grinning mouth
procedure drawMouth2
    drawfillbox (300, 100, 345, 170, faceColour) %erase
    drawfillarc (322, 150, 20, 20, 180, 0, black)
end drawMouth2

%Draws frown mouth
procedure drawMouth3
    drawfillbox (300, 100, 345, 170, faceColour) %erase
    drawarc (322, 130, 20, 20, 0, 180, black)
end drawMouth3

%Draws open sad mouth
procedure drawMouth4
    drawfillbox (300, 100, 345, 170, faceColour) %erase
    drawfillarc (322, 130, 20, 20, 0, 180, black)
end drawMouth4

%Draws open mouth
procedure drawMouth5
    drawfillbox (300, 100, 345, 170, faceColour) %erase
    drawfilloval (322, 140, 20, 20, black)
end drawMouth5

%Draws straight eyebrows
procedure drawEyebrow1
    drawfillbox (250, 250, 390, 270, faceColour) %erase

    Draw.ThickLine (350, 250, 390, 250, 2, black) %right eyebrow
    Draw.ThickLine (250, 250, 290, 250, 2, black) %left eyebrow
end drawEyebrow1

%Draws upwards eyebrows
procedure drawEyebrow2
    drawfillbox (250, 250, 390, 270, faceColour) %erase

    Draw.ThickLine (350, 270, 390, 250, 2, black) %right eyebrow
    Draw.ThickLine (250, 250, 290, 270, 2, black) %left eyebrow
end drawEyebrow2

%Draws downwards eyebrows
procedure drawEyebrow3
    drawfillbox (250, 250, 390, 270, faceColour) %erase

    Draw.ThickLine (350, 250, 390, 270, 2, black) %right eyebrow
    Draw.ThickLine (250, 270, 290, 250, 2, black) %left eyebrow
end drawEyebrow3

%Draws dark guy hair
procedure drawHair1
    drawfilloval (180, 280, 30, 30, 0) %erase
    drawfilloval (460, 280, 30, 30, 0) %erase

    drawfillarc (320, 273, 115, 65, 0, 180, black)
end drawHair1

%Draws blonde guy hair
procedure drawHair2
    drawfilloval (180, 280, 30, 30, 0) %erase
    drawfilloval (460, 280, 30, 30, 0) %erase

    drawfillarc (320, 273, 115, 65, 0, 180, yellow) %hair on head
end drawHair2

%Draws dark buns 
procedure drawHair3
    drawfillarc (320, 273, 115, 65, 0, 180, black) %hair on head
    drawfilloval (180, 280, 30, 30, black) %left bun
    drawfilloval (460, 280, 30, 30, black) %right bun
end drawHair3

%Draws blonde buns
procedure drawHair4
    drawfillarc (320, 273, 115, 65, 0, 180, yellow) %hair on head
    drawfilloval (180, 280, 30, 30, yellow) %left bun
    drawfilloval (460, 280, 30, 30, yellow) %right bun
end drawHair4

%Draws small ears
procedure drawEar1
    drawfillarc (190, 195, 40, 40, 90, 270, 0) %erase
    drawfillarc (450, 195, 40, 40, 270, 90, 0) %erase

    drawfillarc (190, 200, 20, 20, 90, 270, faceColour) %left ear
    drawfillarc (450, 200, 20, 20, 270, 90, faceColour)  %right ear
end drawEar1

%Draws large ears
procedure drawEar2
    drawfillarc (190, 195, 40, 40, 90, 270, 0) %erase
    drawfillarc (450, 195, 40, 40, 270, 90, 0) %erase

    drawfillarc (190, 195, 40, 30, 90, 270, faceColour) %left ear
    drawfillarc (450, 195, 40, 30, 270, 90, faceColour)  %right ear
end drawEar2

%Draws square ears
procedure drawEar3
    drawfillarc (190, 195, 40, 40, 90, 270, 0) %erase
    drawfillarc (450, 195, 40, 40, 270, 90, 0) %erase

    drawfillbox (175, 180, 190, 220, faceColour) %left ear
    drawfillbox (450, 180, 465, 220, faceColour) %right ear
end drawEar3

%Switches windows
procedure closeWin
    GUI.CloseWindow (displayWin) %closes the userInput+display window
    GUI.ShowWindow (mainWin) %shows the main menu window
end closeWin

%Processing and output
procedure display
    drawfillbox (0, 380, 640, 400, 0) 
    locate (1, 33)
    put "Create-a-Face!"
    
    GUI.Hide (doneButton)
    menuButton := GUI.CreateButton (277, 20, 0, "Main menu", closeWin) %goes from displayWin to mainWin
    
    locate (17, 5)
    put "It's beautiful!"..
    locate (17, 60)
    put "Thanks for playing!"..
end display

%Processing and output
procedure userInput
    GUI.HideWindow(mainWin) %hides main window
    displayWin := Window.Open("position:600;500, graphics:640;400") %opens a new window for userInput + display
    title
    face := GUI.CreateMenu ("Face") %1st menu tab
    item (1) := GUI.CreateMenuItem (itemName (1), drawFace1)
    item (2) := GUI.CreateMenuItem (itemName (2), drawFace2)
    item (3) := GUI.CreateMenuItem (itemName (3), drawFace3)
    item (4) := GUI.CreateMenuItem (itemName (4), drawFace4)
    eyes := GUI.CreateMenu ("Eyes") %2nd menu tab
    item (5) := GUI.CreateMenuItem (itemName (5), drawEyes1)
    item (6) := GUI.CreateMenuItem (itemName (6), drawEyes2)
    item (7) := GUI.CreateMenuItem (itemName (7), drawEyes3)
    nose := GUI.CreateMenu ("Nose") %3rd menu tab
    item (8) := GUI.CreateMenuItem (itemName (8), drawNose1)
    item (9) := GUI.CreateMenuItem (itemName (9), drawNose2)
    mouth := GUI.CreateMenu ("Mouth") %4th menu tab
    item (10) := GUI.CreateMenuItem (itemName (10), drawMouth1)
    item (11) := GUI.CreateMenuItem (itemName (11), drawMouth2)
    item (12) := GUI.CreateMenuItem (itemName (12), drawMouth3)
    item (13) := GUI.CreateMenuItem (itemName (13), drawMouth4)
    item (14) := GUI.CreateMenuItem (itemName (14), drawMouth5)
    eyebrows := GUI.CreateMenu ("Eyebrows") %5th menu tab
    item (15) := GUI.CreateMenuItem (itemName (15), drawEyebrow1)
    item (16) := GUI.CreateMenuItem (itemName (16), drawEyebrow2)
    item (17) := GUI.CreateMenuItem (itemName (17), drawEyebrow3)
    hair := GUI.CreateMenu ("Hair") %6th menu tab
    item (18) := GUI.CreateMenuItem (itemName (18), drawHair1)
    item (19) := GUI.CreateMenuItem (itemName (19), drawHair2)
    item (20) := GUI.CreateMenuItem (itemName (20), drawHair3)
    item (21) := GUI.CreateMenuItem (itemName (21), drawHair4)
    ears := GUI.CreateMenu ("Ears") %7th menu tab
    item (22) := GUI.CreateMenuItem (itemName (22), drawEar1)
    item (23) := GUI.CreateMenuItem (itemName (23), drawEar2)
    item (24) := GUI.CreateMenuItem (itemName (24), drawEar3)

    doneButton := GUI.CreateButton (287, 340, 0, "Done", display) %button leads to display
end userInput

%Main menu
body procedure mainMenu
    title
    locate (5, 1)
    put "Select an option."
    GUI.Hide (menuButton)
    playButton := GUI.CreateButton (280, 280, 0, "Play!", userInput) %button leads to game
    instructButton := GUI.CreateButton (265, 235, 0, "Instructions", instructions) %button leads to instructions
    quitButton := GUI.CreateButton (285, 190, 0, "Exit", GUI.Quit) %button exits loop in main program
end mainMenu

%Program displays instructions to play
body procedure instructions
    title
    GUI.Hide (instructButton)
    GUI.Hide (playButton)
    GUI.Hide (quitButton)
    
    locate (4, 27)
    put "How to play Create-a-Face:"
    locate (7, 2)
    put "Simply select the feature you want from the menu bar. Drag your mouse to the"
    locate (8, 18)
    put "option you would like to select, and release."
    locate (10, 15)
    put "Start by selecting a face, and continue from there!"
    locate (12, 9)
    put "When you've finished creating your face, press the Done button."
    locate (14, 20)
    put "The possibilities are endless! Have fun!"
    
    drawfilloval (300, 150, 5, 5, black) %left eye
    drawfilloval (340, 150, 5, 5, black) %right eye
    drawarc (320, 140, 5, 5, 180, 0, black) %mouth
    
    menuButton := GUI.CreateButton (277, 30, 0, "Main menu", mainMenu) %button leads back to main menu
end instructions

%Main program
introduction
loop
    exit when GUI.ProcessEvent
end loop
goodbye
finished := true
Music.PlayFileStop 
%End program



