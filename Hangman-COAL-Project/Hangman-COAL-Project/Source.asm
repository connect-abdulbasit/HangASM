include irvine32.inc
.data

choice BYTE "What do you want ? ",0
choice1 BYTE "1. Play ",0
choice2 BYTE "2. How to play",0
choice3 BYTE "3. Exit ",0

msg1 BYTE "You exit the game successfully Thank you ",0
msg2 BYTE "Do you want to play again ?",0


choice4 BYTE "1.Yes",0
choice5 BYTE "2.No",0

msg3 BYTE "------------WELCOME TO THE HANGMAN GAME --------------------",0
msg4 BYTE " Here's how to play",0
msg5 BYTE " A word will be displayed with some letters missing.",0
msg6 BYTE " Your goal is to guess the missing letters of the word.",0
msg7 BYTE " You can guess one letter at a time.",0
msg8 BYTE " For each correct guess, the missing letter will be revealed.",0
msg9 BYTE " You have a total of 6 wrong guesses allowed.",0
msg10 BYTE " Every wrong guess will result in a penalty of 1 mark.",0
msg11 BYTE " Starting marks: 10. For each wrong guess, 1 mark will be deducted.",0
msg12 BYTE " If you guess a wrong letter, the number of wrong guesses will increase by 1",0
msg13 BYTE " If you reach 6 wrong guesses, the game ends, and you lose the marks you have left.",0
msg14 BYTE " If you guess all the correct letters within 6 wrong guesses, you win with the remaining marks.",0
msg15 BYTE " After the game ends, your final score will be calculated based on the remaining marks.",0
msg16 BYTE " -------------------------- Tips ------------------------:",0
msg17 BYTE " Keep track of the letters you've guessed to avoid repeating guesses.",0
msg18 BYTE " Good luck, and have fun !",0
endingPrompt BYTE "Press any key to continue...",0
wrongGuessPrompt BYTE "Nope, that letter isn't in the word. Keep trying!",0
rightGuessPrompt BYTE "Nice! That letter is in the word. Keep it up!",0
correctWord Byte "The correct word is: ",0
select_option DWORD ?
Dash byte "_",0
SelectedWord byte 10 DUP(?)
GuessWord byte 10 DUP(?)
lengthOfWord DWORD ?
Score DWORD ?
Attempts DWORD ?
checkcorrectattempt DWORD 0
scoremessage1 BYTE "You Scored ",0
scoremessage2 BYTE "/10",0

GuessWord1 BYTE "ORANGE",0, "FAMILY",0, "SILVER",0, "DONATE",0, "MONDAY",0, "NATURE",0, "BROKEN",0, "RACHEL",0, "FRIDAY",0, "FATHER", 0
GuessWord2 BYTE "JASMINE",0, "OSTRICH",0, "CHAPTER",0, "CRYSTAL",0, "DEPOSIT",0, "HOLIDAY",0, "CALIBER",0, "KITCHEN", 0,"KINGDOM",0, "ACQUIRE", 0
GuessWord3 BYTE "DINOSAUR",0,"PROVIDES",0,"DYNAMICS",0,"PRODUCES",0,"ALPHABET",0,"UNDERWAY",0,"UNIFORMS",0,"UNIQUELY",0,"THURSDAY",0,"ANTIHERO",0
GuessWord4 BYTE "DANGEROUS",0, "MASCULINE",0, "SOMETHING",0, "KNOWLEDGE",0, "WRESTLING",0, "WONDERFUL", 0, "EDUCATION",0, "CELEBRATE",0, "ALONGSIDE",0, "COMPANIES", 0

HangmanStages db "   +---+  ", 0Dh, 0Ah
              db "   |   |  ", 0Dh, 0Ah
              db "       |  ", 0Dh, 0Ah
              db "       |  ", 0Dh, 0Ah
              db "       |  ", 0Dh, 0Ah
              db "       |  ", 0Dh, 0Ah
              db "  ========", 0Dh, 0Ah, 0

Stage1 db "   +---+  ", 0Dh, 0Ah
        db "   |   |  ", 0Dh, 0Ah
        db "   O   |  ", 0Dh, 0Ah
        db "       |  ", 0Dh, 0Ah
        db "       |  ", 0Dh, 0Ah
        db "       |  ", 0Dh, 0Ah
        db "  ========", 0Dh, 0Ah, 0

Stage2 db "   +---+  ", 0Dh, 0Ah
        db "   |   |  ", 0Dh, 0Ah
        db "   O   |  ", 0Dh, 0Ah
        db "   |   |  ", 0Dh, 0Ah
        db "       |  ", 0Dh, 0Ah
        db "       |  ", 0Dh, 0Ah
        db "  ========", 0Dh, 0Ah, 0

Stage3 db "   +---+  ", 0Dh, 0Ah
        db "   |   |  ", 0Dh, 0Ah
        db "   O   |  ", 0Dh, 0Ah
        db "  /|   |  ", 0Dh, 0Ah
        db "       |  ", 0Dh, 0Ah
        db "       |  ", 0Dh, 0Ah
        db "  ========", 0Dh, 0Ah, 0

Stage4 db "   +---+  ", 0Dh, 0Ah
        db "   |   |  ", 0Dh, 0Ah
        db "   O   |  ", 0Dh, 0Ah
        db "  /|\  |  ", 0Dh, 0Ah
        db "       |  ", 0Dh, 0Ah
        db "       |  ", 0Dh, 0Ah
        db "  ========", 0Dh, 0Ah, 0

Stage5 db "   +---+  ", 0Dh, 0Ah
        db "   |   |  ", 0Dh, 0Ah
        db "   O   |  ", 0Dh, 0Ah
        db "  /|\  |  ", 0Dh, 0Ah
        db "  /    |  ", 0Dh, 0Ah
        db "       |  ", 0Dh, 0Ah
        db "  ========", 0Dh, 0Ah, 0

Stage6 db "   +---+  ", 0Dh, 0Ah
        db "   |   |  ", 0Dh, 0Ah
        db "   O   |  ", 0Dh, 0Ah
        db "  /|\  |  ", 0Dh, 0Ah
        db "  / \  |  ", 0Dh, 0Ah
        db "       |  ", 0Dh, 0Ah
        db "  ========", 0Dh, 0Ah, 0

.code
main proc 

mainMenu:
call clrscr
mov edx , offset choice
call writestring
call crlf

mov edx , offset choice1
call writestring
call crlf

mov edx , offset choice2
call writestring
call crlf

mov edx , offset choice3
call writestring
call crlf

call readdec
mov select_option , eax


cmp select_option , 1
je play

cmp select_option , 2
je how_to_play

cmp select_option , 3
je endprogram

play:
call function_play

mov edx , offset msg2
call writestring
call crlf

mov edx , offset choice4
call writestring
call crlf

mov edx , offset choice5
call writestring
call crlf

call readdec
mov select_option , eax

cmp select_option , 1
je play
jmp skip

how_to_play:
call function_howtoplay

skip:
jmp mainMenu

endprogram:
mov edx , offset msg1
call writestring 
exit
main endp

function_howtoplay proc
call clrscr
call crlf
mov edx , offset msg3
call writestring
call crlf
call crlf

mov edx , offset msg4
call writestring
call crlf

mov edx , offset msg5
call writestring
call crlf

mov edx , offset msg6
call writestring
call crlf

mov edx , offset msg7
call writestring
call crlf

mov edx , offset msg8
call writestring
call crlf

mov edx , offset msg9
call writestring
call crlf

mov edx , offset msg10
call writestring
call crlf

mov edx , offset msg11
call writestring
call crlf

mov edx , offset msg12
call writestring
call crlf

mov edx , offset msg13
call writestring
call crlf

mov edx , offset msg14
call writestring
call crlf

mov edx , offset msg15
call writestring
call crlf
call crlf

mov edx , offset msg16
call writestring
call crlf


mov edx , offset msg17
call writestring
call crlf
call crlf

mov edx , offset msg18
call writestring
call crlf
call crlf

mov edx,offset endingPrompt
call writestring
call readdec
ret 
function_howtoplay endp

function_play proc
call SelectWord
call WordFormation

call crlf

mov score,0
mov Attempts,6

play_loop:
call clrscr

call display_hangman
mov edx , offset GuessWord
call writestring
call crlf
call readchar
call writechar
call crlf
call checkWord
mov ecx , lengthOfWord
mov esi , offset selectedWord
mov edi , offset GuessWord
repe cmpsb
je exitplayloop
mov ecx,Attempts

cmp ecx,0
jg play_loop
exitplayloop:
call clrscr
call display_hangman
mov edx , offset GuessWord
call writestring
call ScoreCalculate

call crlf
mov edx,offset scoremessage1
call writestring
call writedec
mov edx,offset scoremessage2
call writestring
call crlf

mov edx,offset endingPrompt
call writestring
call readdec

call clrscr


ret
function_play endp

display_hangman proc
mov eax,Attempts
cmp eax, 0
    je stage_0
    cmp eax, 1
    je stage_1
    cmp eax, 2
    je stage_2
    cmp eax, 3
    je stage_3
    cmp eax, 4
    je stage_4
    cmp eax, 5
    je stage_5
    cmp eax, 6
    je stage_6
    jmp end_display

stage_0:
    mov edx, offset HangmanStages
    jmp display

stage_1:
    mov edx, offset Stage1
    jmp display

stage_2:
    mov edx, offset Stage2
    jmp display

stage_3:
    mov edx, offset Stage3
    jmp display

stage_4:
    mov edx, offset Stage4
    jmp display

stage_5:
    mov edx, offset Stage5
    jmp display

stage_6:
    mov edx, offset Stage6
    jmp display

display:
    call writestring
    call crlf
    ret
    end_display:

ret
display_hangman endp

SelectWord proc
call randomize
mov eax,4
call randomrange
cmp eax,0
je six
cmp eax,1
je seven
cmp eax,2
je eight
jmp nine

six:

mov lengthOfWord,6
call randomize
mov eax,10
call randomrange
mov ebx,7
mul ebx
mov edx,offset GuessWord1
add edx,eax
mov ecx,7
jmp printWord

seven:
mov lengthOfWord,7
call randomize
mov eax,10
call randomrange
mov ebx,8
mul ebx
mov edx,offset GuessWord2
add edx,eax
mov ecx,8
jmp printWord


eight:
mov lengthOfWord,8
call randomize
mov eax,10
call randomrange
mov ebx,9
mul ebx
mov edx,offset GuessWord3
add edx,eax
mov ecx,9
jmp printWord


nine:
mov lengthOfWord,9
call randomize
mov eax,10
call randomrange
mov ebx,10
mul ebx
mov edx,offset GuessWord4
add edx,eax
mov ecx,10
jmp printWord


printWord:


mov esi,0
l1:
mov al,[edx+esi]
mov SelectedWord[esi],al
cmp ecx,1
je exitLoop
mov GuessWord[esi],"_"
inc esi
loop l1

exitLoop:

mov GuessWord[esi],al
mov edx,offset SelectedWord
ret
SelectWord endp


WordFormation proc

mov ecx,lengthOfWord
mov ebx,ecx
shr ecx,1

reveal_loop:
call randomize
mov eax,ebx
call randomrange
mov dl, GuessWord[eax]     
cmp dl, '_'                
jne reveal_loop 
mov dl,SelectedWord[eax]
mov GuessWord[eax],dl
loop reveal_loop

ret
Wordformation endp

checkWord proc


mov ecx , lengthof SelectedWord

mov esi , offset SelectedWord
mov edi , offset GuessWord

CheckLoop:

cmp al , [esi]

je UpdateWord
jne ContinueChecking

UpdateWord:

mov bl,[edi]

cmp bl , al

je AlreadyGuess

mov [edi] , al

mov checkcorrectattempt , 1

ContinueChecking:

inc esi
inc edi

loop CheckLoop

AlreadyGuess:
cmp checkcorrectattempt , 0

jne EndProcedure
mov edx,offset wrongGuessPrompt
call writestring
call crlf
dec Attempts
jmp printResult

EndProcedure:
mov edx,offset rightGuessPrompt
call writestring
call crlf
printResult:
mov edx,offset endingPrompt 
call writestring
call readdec  
mov checkcorrectattempt , 0

ret
checkWord endp

ScoreCalculate Proc 

cmp Attempts , 0

je zeromarks

mov edx,6
mov Score,10

sub  edx , Attempts

sub Score,edx

mov eax , Score
jmp endScoring

zeromarks:

mov Score,0
mov eax,Score
call crlf
mov edx,offset correctWord
call writestring
mov edx,offset selectedWord
call writestring

endScoring:
ret
ScoreCalculate endp

end main