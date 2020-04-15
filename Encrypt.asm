TITLE Encryption Program

INCLUDE Irvine32.inc
KEY = 219
BUFMAX = 128

.data
sPrompt BYTE "Enter the plain text:",0
sEncrypt BYTE "Cipher text:     ",0
sDecrypt BYTE "Decrypted:       ",0
buffer BYTE   BUFMAX+1 Dup(0)				;+1�� �ΰ��� ����.
bufSize DWORD ?

.code
main PROC
	 call InputTheString				;InputTheString �Լ� ȣ��.
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
	pushad								;���ÿ� �������Ϳ� �� �ѹ��� ����. ������ EAX,ECX,EDX,EBX,ESP,EBP,ESI,EDI
	mov edx,OFFSET sPrompt				;���� �ֿܼ� ���. ���ڿ��� �ּҸ� EDX�� ����.
	call WriteString
	mov ecx,BUFMAX
	mov edx,OFFSET buffer
	call ReadString						;����ڿ��� �Է¹���.
	mov bufSize,eax
	call Crlf
	popad								;���ÿ� ���� �ݴ� ������ ����.
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
	xor buffer[esi],KEY					;xor�� ���ʸ� 1�̾�� 1�� �ȴ�. KEY = 11101111
	inc esi
	loop L1
	popad
	ret
TranslateBuffer ENDP
END main