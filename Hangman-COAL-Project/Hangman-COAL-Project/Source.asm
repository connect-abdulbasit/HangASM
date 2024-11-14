include irvine32.inc
.data

choice BYTE "What do you want ? ",0
choice1 BYTE "1.  play ",0
choice2 BYTE "2.  how to play",0
choice3 BYTE "3.  exit ",0

msg1 BYTE "You exit the game successfully Thank you ",0
msg2 BYTE "Do you want to play again ?",0

choice4 BYTE "1.yes",0
choice5 BYTE "2.No",0

msg3 BYTE "------------WLECOME TO THE HANGMAN GAME --------------------",0
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

select_option DWORD ?


.code
main proc 

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

jmp endprogram

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
jmp endprogram

how_to_play:
call function_howtoplay
jmp endprogram

endprogram:
mov edx , offset msg1
call writestring 
exit
main endp

function_howtoplay proc

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


ret 
function_howtoplay endp

function_play proc


ret
function_play endp

end main