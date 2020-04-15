TITLE Extended_Add	(ExtAdd.asm)

INCLUDE Irvine32.inc

.data
op1 BYTE 34h,12h,98h,74h,06h,0A4h,0B2h,0A2h
op2 BYTE 02h,45h,23h,00h,00h,87h,10h,80h 
sum BYTE 9 dup(0)


.code
main PROC
	mov esi,OFFSET op1
	mov edi,OFFSET op2
	mov ebx,OFFSET sum
	mov ecx,LENGTHOF op1
	call Extended_Add

;Display the sum.

	mov esi,OFFSET sum
	mov ecx,LENGTHOF sum
	call Display_Sum
	call Crlf

	 exit

main ENDP


Extended_Add PROC
	pushad
	clc

L1: mov al,[esi]
	adc al,[edi]
	pushfd
	mov [ebx],al
	add esi,1
	add edi,1
	add ebx,1
	popfd
	loop L1

	mov byte ptr [ebx],0
	adc byte ptr [ebx],0
	popad
	ret
Extended_Add ENDP


Display_Sum PROC
	pushad
	;point to the last array element
	add esi,ecx
	sub esi,TYPE BYTE
	mov ebx,TYPE BYTE

L1: 
	mov al,[esi]
	call WriteHexB
	sub esi,TYPE BYTE
	loop L1

	popad
	ret
Display_Sum ENDP










END main