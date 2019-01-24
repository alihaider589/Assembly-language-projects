.model small
.stack 100h
.data
x db 0
counter2 db 0
counter db 0
line db 10,10,10,'$'
result db 10,10,10,10,10,10,0,10,10,10,10,10,9,9,9,9, 'your score is :  $'
ans db 9,9,'Your answer is : $'
titl db 10,10,10,10,'		----------------PROJECT FOR QUIZ SYSTEM----------------$'
q1 db 'Q1 )  ____ converts the programs written in assembly language into machine     	instructions.$'
a1 db 'a) Machine compiler	  b)  Interpreter	c)  Assembler	d) Converter $'

q2 db 'Q2 ) The instructions like MOV or ADD are called as ______$'
a2 db 'a) OP-Code	 b) Operators	c) Commands		d) None of these $'

q3 db 'Q3 ) _____ directive specifies the end of execution of a program.$'
a3 db 'a) End	b) Return	c) Stop		d) Terminate$'

q4 db 'Q4 )The last statement of the source program should be _______$'
a4 db 'a) Stop	b) Return	c) OP	d) End$'

q5 db 'Q5 )The utility program used to bring the object code into memory for execution is ______$'
a5 db 'a) Loader	b) Fetcher	c) Extractor	d) Linker$'

q6 db 'Q6 )Which is not a funciton of a loader$'
a6 db 'a)allocation		b)translation	c)relocation	d)loading$'

q7 db 'Q7 ) The assembler stores the object code in ______$'
a7 db 'a) Main memory	b) Cache	c) RAM	d) Magnetic disk$'

q8 db 'Q8 )  _____ directive is used to specify and assign the memory required for the block of code.$'
a8 db 'a) Allocate	b) Assign	c) Set	d) Reserve$'

q9 db 'Q9 ) To overcome the problems of the assembler in dealing with branching code we use _____$'
a9 db 'a) Interpreter	b) Debugger	c) Op-Assembler	d) Two-pass assembler$'

q10 db 'Q10 ) _______is the first step in the evolution of programming  languages$'
a10 db 'a) machine language	b)assembly language	c) code language	d)none of these$'
.code
start:
mov ax,@data
mov ds,ax

	mov counter,0

	que macro p1,p2
	
	;delay
;	MOV     CX, 0FH
;	MOV     DX, 4240H
;	MOV     AH, 86H
;	INT     15H
	;clear screen

mov al,06h
mov ah,00h
int 10h

 mov ah,0bh
 mov bh,00h
 mov bl,8
 int 10h

mov ah,09
lea dx,titl
int 21h
			mov ah,09
			lea dx,line
			int 21h	
		mov ah,09
		lea dx,p1
		int 21h
			mov ah,09
			lea dx,line
			int 21h	
				mov ah,09
				lea dx,p2
				int 21h
			mov ah,09
			lea dx,line
			int 21h	
						mov ah,09
						lea dx,ans
						int 21h		
							mov ah,01
							int 21h
							mov cl,al
			;mov ah,09
			;lea dx,line
			;int 21h	
		endm que
		que q1,a1
			mov bl,'c'
		cmp bl,cl
	je inc1
	
	
	
	jmp second
	inc1:
	
		add counter,1
		
	jmp second
	second:
	que q2,a2
			
		mov bl,'a'
		cmp bl,cl
	je inc2

	
	jmp third
	inc2:
		add counter,1
			jmp third
			
	third:	
	que q3,a3
			mov bl,'b'
		cmp bl,cl
	je inc3

	
	jmp fourth
	inc3:
	
		add counter,1
	
	
			jmp fourth
	fourth :	
	que q4,a4
			mov bl,'d'
		cmp bl,cl
	je inc4

	
	jmp fifth
	inc4:
	
		add counter,1
	
		jmp fifth
	fifth:
		que q5,a5
			mov bl,'a'
		cmp bl,cl
	je inc5

	
	jmp sixth
	inc5:
	
		add counter,1
	
		jmp sixth	
	sixth:
	que q6,a6
			mov bl,'b'
		cmp bl,cl
	je inc6

	
	jmp seventh
	inc6:
	
		add counter,1
	
		jmp seventh
	seventh:
	que q7,a7
			mov bl,'d'
		cmp bl,cl
	je inc7

	
	jmp eighth
	inc7:
	
		add counter,1
	
		jmp eighth
	eighth:
	que q8,a8
			mov bl,'d'
		cmp bl,cl
	je inc8

	
	jmp ninth
	inc8:
	
		add counter,1
	
		jmp ninth	
	ninth:
	que q9,a9
			mov bl,'d'
		cmp bl,cl
	je inc9

	
	jmp tenth
	inc9:
	
		add counter,1
	
		jmp tenth
	tenth:
	que q10,a10
			mov bl,'b'
		cmp bl,cl
	je inc10

	
	jmp end1
	inc10:
		mov dl,counter
		int 21h
		mov bl,9
		int 21h
		cmp dl,bl
			je sec_con
				add counter,1
				jmp end1
					sec_con:
						
						mov counter2,1
						mov counter,0
						int 21h
			
		jmp end1	
			end1:
			mov al,06h
mov ah,00h
int 10h

 mov ah,0bh
 mov bh,00h
 mov bl,8
 int 10h
		mov ah,09
		lea dx,result
		int 21h
				add counter2,48
				mov ah,02		
				mov dl,counter2				
				int 21h
					mov ah,02
					add counter,48
					mov dl,counter
					int 21h
				mov ah,4ch
				int 21h
				endp
				end start
				
				end second
				end third
				end fourth
				end fifth
				end sixth
				end seventh
				end eighth
				end ninth
				end tenth
				end sec_con