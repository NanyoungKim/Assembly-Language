TITLE Encryption Program

INCLUDE Irvine32.inc
KEY = 219
BUFMAX = 128

.data
sPrompt BYTE "Enter the plain text:",0
sEncrypt BYTE "Cipher text:     ",0
sDecrypt BYTE "Decrypted:       ",0
buffer BYTE   BUFMAX+1 Dup(0)				;+1은 널값을 위함.
bufSize DWORD ?

.code
main PROC
	 call InputTheString				;InputTheString 함수 호출.
	 call TranslateBuffer

	 mov edx,OFFSET sEncrypt

	 call DisplayMessage
	 call TranslateBuffer
	 mov edx,OFFSET sDecrypt

	 call DisplayMessage
	 exit
main ENDP
;-------------------------------------------------
InputTheString PROC
;
;Promts user for a plaintext string. Saves the string and its length.
;Receves : nothing
;Returns: nothing
;-------------------------------------------------
	pushad								;스택에 레지스터에 값 한번에 넣음. 순서는 EAX,ECX,EDX,EBX,ESP,EBP,ESI,EDI
	mov edx,OFFSET sPrompt				;널을 콘솔에 출력. 문자열의 주소를 EDX에 전달.
	call WriteString
	mov ecx,BUFMAX
	mov edx,OFFSET buffer
	call ReadString						;사용자에게 입력받음.
	mov bufSize,eax
	call Crlf
	popad								;스택에 넣은 반대 순서로 팝함.
	ret
InputTheString ENDP
;------------------------------------------------
DisplayMessage PROC
;
;Displays the encrypted of decrypted message.
;Receives: EDX points to the message
;Returns: nothing
;------------------------------------------------
	pushad
	call WriteString
	mov edx,OFFSET buffer
	call WriteString
	call Crlf
	call Crlf
	popad
	ret
DisplayMessage ENDP
;------------------------------------------------
TranslateBuffer PROC
;
;Translates the string by exclusive-ORing each byte
;with the encryption key byte.
;Receives: nothing
;Returns: nothing
;-------------------------------------------------

	pushad
	mov ecx,bufSize
	mov esi,0
L1:
	xor buffer[esi],KEY					;xor은 한쪽만 1이어야 1이 된다. KEY = 11101111
	inc esi
	loop L1
	popad
	ret
TranslateBuffer ENDP
END main