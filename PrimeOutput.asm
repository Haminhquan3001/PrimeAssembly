comment!
6/1/2021
The program prompt the user to enter a number 
and will return and display all the prime number from 1
to the given number - 1
!

include irvine32.inc

.data
input_mess byte "Please enter a number: " ,0
display_mess byte "Primes found until given number: ",0
press_mess byte "Press any key to continue...", 0

i dword 2
.code

main PROC

;display the message to prompt the user
mov edx, offset input_mess
call writeString

; the user input will be stored in eax
call readDec
call crlf

;display message 
mov edx, offset display_mess
call writeString
call crlf

;loop n-1 times where n is the number the user entered
mov ecx, eax
sub ecx, 1

L2:
;store ecx to the stack
push ecx
mov eax, i
call isPrime

comment ^
if(edi == 1){
cout << n << " ";
}
else{
i++;
}
^

cmp edi, 1
jne out02
call writeDec
mov al, ' '
call writeChar
out02: 
	inc i
	;increment the value of ecx on the stack
	pop ecx
loop L2


call crlf
;display press_mess
mov edx, offset press_mess
call writeString
call readChar 

exit
main ENDP


;isPrime procedure receives a number through one of the registers(eax)
;check if this number is prime
;return backs through one of the registers to the main program
;1 if the number is prime
;0 other wise

isPrime proc

;set the return value
mov edi, 1
comment @
if(eax != 2){//the base case of prime number
ecx = eax;
ecx -= 2;
esi = 2;

for(int i = 0; i < ecx; i++){
if(remainder == 0){
edi = 0;
}
else{
i++;
}
}
}
else{
return edi;
}
@

cmp eax, 2
je out01

mov ecx, eax
sub ecx, 2

xor esi, esi
mov esi, 2
L1:
	push eax
	;zero out edx
	xor edx, edx
	div esi
	cmp edx, 0
	jne then01
	;set the return edi to 0
	mov edi, 0
then01:
	inc esi
	pop eax
loop L1

out01: 
ret
isPrime endp

END main

comment #
SAMPLE RUN :
Please enter a number: 44

Primes found until given number:
2 3 5 7 11 13 17 19 23 29 31 37 41 43
Press any key to continue...
C:\CIS 21JA\Project32_VS2019\Debug\Project.exe (process 2076) exited with code 0.
Press any key to close this window . . .

#

