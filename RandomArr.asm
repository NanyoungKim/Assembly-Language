TITLE RandomArray	(RandomArr.asm)

INCLUDE Irvine32.inc

.data
count = 64
array SWORD count Dup(?)  
num DWORD ? 


.code
main PROC
	 push OFFSET array
	 push count
	 call ArrayRandom

	 exit

main ENDP


ArrayRandom PROC
 	push ebp
	mov ebp,esp
	pushad
	mov esi,[ebp+12]
	mov ecx,[ebp+8]
	cmp ecx,0
	je L2

L1:
	mov eax,1000h
	mov ebx,0
	call RandomRange
	sub eax,500h
	mov [esi],ax
	call WriteInt
	call Crlf

	.IF esi<0 
		add ebx,1
	.ENDIF

	add esi,TYPE word
	loop L1

L2:
	call DumpRegs
	popad
	pop ebp
	ret 8

ArrayRandom ENDP



END main