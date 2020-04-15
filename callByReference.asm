TITLE callByReference
INCLUDE Irvine32.inc


.data
val1 DWORD 2
val2 DWORD 5


.code
main PROC

		mov eax,0
		push OFFSET val1
		push OFFSET val2

		mov eax,val2
		mov ecx,val1
		
		call clrscr 
		call dumpregs
		call xchgfunc
		call DumpRegs

		exit
main	ENDP

xchgfunc PROC

		push ebp
		mov ebp,esp

		mov ebx,[ebp+12]
		mov edi,[ebp+8]
		mov eax,[ebx]			;eax에 2들어있다
		mov ecx,[edi]			;ecx에 5가 들어있다

		pop ebp
		ret 8


xchgfunc ENDP

END main
