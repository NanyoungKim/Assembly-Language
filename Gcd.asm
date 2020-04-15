TITLE gcd	(Gcd.asm)

INCLUDE Irvine32.inc

.data
firstQ BYTE "First integer is : ",0
secondQ BYTE "Second integer is : ",0
firstInt SDWORD ?
secondInt SDWORD ?
temp BYTE ?
GCD BYTE "GCD is : ",0

.code
main PROC
	
GCDloop:
	mov edx,OFFSET firstQ
	call WriteString		;����1���
	call ReadInt			;����1�Է�(eax�� ����)
	mov firstInt, eax

	mov edx,OFFSET secondQ
	call WriteString		;����2���
	call ReadInt			;����2�Է�(eax�� ����)

	mov secondInt, eax

	mov eax,firstInt		;����

	cdq						;eax�� ��ȣ��Ʈ�� edx�� Ȯ��
	xor eax,edx
	sub eax,edx
	mov firstInt,eax
	mov eax,secondInt

	cdq
	xor eax,edx
	sub eax,edx
	mov secondInt, eax


GCDloop2:
	mov edx,0
	mov eax,firstInt
	div secondInt			;int n = x%y  al���� ��,ah���� 
	

	mov eax, secondInt		;x = y;
	mov firstInt, eax		; 
	

	mov secondInt, edx	

	cmp secondInt,0			;second > 0?

	ja GCDloop2				;while(second>0)




	mov edx, OFFSET GCD
	call WriteString		;GCD is : ~~

	mov esi,OFFSET firstInt
	mov eax, [esi]

	call WriteDec
	call Crlf

	jmp GCDloop
	
	exit
	main ENDP
	END main



