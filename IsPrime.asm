TITLE IsPrime  (IsPrime.asm)

INCLUDE Irvine32.inc

.data
intro BYTE "Enter a number : ",0
isPrime BYTE "This number is prime.",0
isNotPrime BYTE "This number is not prime.",0
num DWORD 0


.code
main PROC

	mov edx,OFFSET intro		;���ڸ� �Է��Ͻÿ�.
	call WriteString			;���� ���
	call ReadInt				;���� �Է�
	mov num,eax					

	mov ecx,num					;ī��Ʈ
 

;	call isPrime
	mov ebx,0





L1:
	mov edx,0

	mov eax,num
	div ecx

	.IF edx==0		;������ ��������
		inc ebx			;ī��Ʈ ����

	.ENDIF
	loop L1
	

.IF  ebx==2
	mov edx,OFFSET isPrime
	call WriteString


.ELSE
	mov edx,OFFSET isNotPrime
	call WriteString
.ENDIF









main ENDP
END main



