TITLE callByValue
INCLUDE Irvine32.inc


.data
val1 DWORD 2
val2 DWORD 5


.code
main PROC

		mov eax,val1
		mov ebx,val2
		
		push val1
		push val2

		call clrscr 
		call dumpregs

		call xchgfunc
		call DumpRegs

		exit
main	ENDP

xchgfunc PROC

		push ebp
		mov ebp,esp

		mov eax,DWORD PTR[ebp+8]			;eax�� val2�� ��	
		mov ebx,DWORD PTR[ebp+12]			;ebx�� val1�� ��
		pop ebp
		ret 8


xchgfunc ENDP

END main
