Title integer Summation Program

Include Irvine32.inc
INTEGER_COUNT=3

.data
str1 BYTE "Enter a signed integer: ",0
str2 BYTE "The sum of the integers is: ",0
array DWORD INTEGER_COUNT DUP(?)


.code
main PROC

	call Clrscr
	mov esi, OFFSET array
	mov ecx, INTEGER_COUNT
	call PromptForIntegers
	call ArraySum
	call DisplaySum
	exit
main ENDP

;--------------------------------------------------------

PromptForIntegers PROC USES ecx edx esi

	mov edx,offset str1

L1: call WriteString
	call ReadInt
	call Crlf
	mov [esi],eax
	add esi,TYPE DWORD
	loop L1
	ret
PromptForIntegers ENDP

;-------------------------------------------------------- 

ArraySum Proc USES esi ecx

	mov eax,0

L1: add eax,[esi]
    add esi,TYPE DWORD
    loop L1
    ret
ArraySum ENDP

;--------------------------------------------------------
DisplaySum PROC USES edx

	mov edx,OFFSET str2
	call WriteString
	call WriteInt
	call Crlf
	ret
DisplaySum ENDP



end main
