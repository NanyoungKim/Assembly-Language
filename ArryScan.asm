TITLE Scanning an Array  (ArryScan.asm)
;Scan an array for the first nonzero value.

INCLUDE Irvine32.inc

.data
intArray SWORD 0,0,0,8,1,20,35,-12,66,4,0

noneMsg BYTE "A non-zero value was not found",0

.code
main PROC
	 mov ebx, OFFSET intArray  ;ebx�� �迭�� ù element�� �ּҸ� �ִ´�.
	 mov ecx,LENGTHOF intArray  ;ecx�� �迭�� ���̸� �־� ����ī���͸� ���Ѵ�.

L1: cmp	WORD PTR [ebx],0     ;intArray�� ��Ҹ� ���� 0�� ���Ѵ�.
	jnz found				 ;��� ���� 0�� �ƴ� �ÿ� ����  (������� 0�̶�� ���� �迭 ��Ұ� 0�̶�� ��.)
	add ebx,2				 ;�迭�� SWORD ��, 2����Ʈ �̹Ƿ� 2�� ���Ѵ�.
	loop L1

	jmp notFound			 ;���� �� ���� ������ ����

found:								;�迭 ��Ұ� 0�� �ƴ� ��
	movsx eax,WORD PTR[ebx]         ;eax�� 0�� �ƴ� �� ����� ���� ����.
	call WriteInt
	jmp quit

notFound:							;�迭 ��Ұ� 0�� ��
	mov edx,OFFSET noneMsg			;0�� �ƴ� ���� ã�� ���ߴ� = 0�̴�.
	call WriteString

quit:
	call Crlf
	exit

main ENDP
END main