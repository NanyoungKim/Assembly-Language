TITLE Swap Procedure Example		(Swap_CallVer.asm)
INCLUDE Irvine32.inc

.data
Array DWORD 10000h,20000h

.code
main PROC
	mov esi, OFFSET Array
	mov ecx,2
	mov ebx,TYPE Array
	call DumpMem
	  	
	call Swap
	call DumpMem

main ENDP

Swap PROC USES eax esi edi

	mov esi,OFFSET Array			;10000h이 담긴 메모리의 주소를 esi에 저장
	mov edi,OFFSET Array+4			;20000h이 담긴 메모리의 주소를 edi에 저장 (DWORD인 배열이므로 +4해줌)
	mov eax,[esi]
	xchg eax,[edi] 
	mov [esi],eax
	ret
Swap ENDP
END main