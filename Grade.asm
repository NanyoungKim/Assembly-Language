TITLE Grade	(Grade.asm)

INCLUDE Irvine32.inc

.data
	score DWORD ?
	str1 BYTE "Enter your score: ",0
	str2 BYTE "This is your grade: ",0
	grade BYTE ?

.code
main PROC
	call Clrscr
	mov edx,OFFSET str1
	call WriteString

	call ReadInt
	mov score,eax

	.IF score>=90 && score<=100
		mov grade,'A'
		call WriteGrade
	.ENDIF

	.IF score>=80 && score<90
		mov grade,'B'
		call WriteGrade
	.ENDIF 

	.IF score>=70 && score<80
		mov grade,'C'
		call WriteGrade
	.ENDIF

	.IF score>=60 && score<70
		mov grade,'D'
		call WriteGrade
	.ENDIF

	.IF score<60
		mov grade,'F'
		call WriteGrade
	.ENDIF

	ret
main ENDP

WriteGrade PROC
	mov edx,OFFSET str2
	call WriteString
	mov edx,OFFSET grade
	call WriteString
	ret
WriteGrade ENDP
END main


