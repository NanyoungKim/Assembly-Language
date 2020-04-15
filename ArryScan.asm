TITLE Scanning an Array  (ArryScan.asm)
;Scan an array for the first nonzero value.

INCLUDE Irvine32.inc

.data
intArray SWORD 0,0,0,8,1,20,35,-12,66,4,0

noneMsg BYTE "A non-zero value was not found",0

.code
main PROC
	 mov ebx, OFFSET intArray  ;ebx에 배열의 첫 element의 주소를 넣는다.
	 mov ecx,LENGTHOF intArray  ;ecx에 배열의 길이를 넣어 루프카운터를 정한다.

L1: cmp	WORD PTR [ebx],0     ;intArray의 요소를 각각 0과 비교한다.
	jnz found				 ;결과 값이 0이 아닐 시에 점프  (결과값이 0이라는 말은 배열 요소가 0이라는 말.)
	add ebx,2				 ;배열이 SWORD 즉, 2바이트 이므로 2를 더한다.
	loop L1

	jmp notFound			 ;루프 다 돌면 무조건 점프

found:								;배열 요소가 0이 아닐 때
	movsx eax,WORD PTR[ebx]         ;eax에 0이 아닌 그 요소의 값을 넣음.
	call WriteInt
	jmp quit

notFound:							;배열 요소가 0일 때
	mov edx,OFFSET noneMsg			;0이 아닌 값을 찾지 못했다 = 0이다.
	call WriteString

quit:
	call Crlf
	exit

main ENDP
END main