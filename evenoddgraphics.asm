.model small
	.stack 100h
	
	.data
	
	msg1 db': odd$'
	msg2 db': even$'
	msg3 db '           !!!-------------WELCOME-------------!!!$'
	msg4 db 'ENTER YOUR NUMBERS (0-9)$:'
	msg5 db'                      SUMMARY:::$'
	msg6 db '             YOU HAVE ENTERED 9 NUMBERS$'
msg7 db'	           THANKYOU FOR USING $'
	.code
	main proc
	
Mov ah, 0 ; set mode 
mov al,04h  ; mode 4
int 10h

mov ah,0bh   ; function 0BH for background 
mov bh,00h   ; select background color 
mov bl,3       ; blue
int 10h
mov ah,02    ; set cursor 
mov bh,0   ; page 0
mov dh,0    ; row 0
mov dl,30   
int 10h

	MOV AX,@DATA              
MOV DS, AX                       
LEA DX, msg3                    
MOV AH, 09h                   
INT 21H                             
    
MOV AX,@DATA              
MOV DS, AX                       
LEA DX, msg4                    
MOV AH, 09h                   
INT 21H                             
mov ah, 02
mov dl, 0ah
int 21h
mov ah,2
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h
	mov ax, @data
	mov ds,ax
	
	
	;when loop called it uses cx as counter
	mov cx,9
	
	
	;loop label
	looper:
	
	;input a number 
	mov ah,1
	int 21h
	
	;divide any number in al by bl or 2 here
	mov bl,2
	div bl
	
	cmp ah,1
	je even1
	
	mov ah,9
	lea dx, msg2
	int 21h
	
	jmp skip
	
	even1: 
	mov ah,9
	lea dx, msg1
	int 21h
	
	
	skip:
	
	;prints a newline
	mov ah,2
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h
	
	
	loop looper
	mov ax, 3
	int 10h
	
	
	mov ah, 02
mov dl, 0ah
int 21h   
	MOV AX,@DATA              
MOV DS, AX                       
LEA DX, msg5                    
MOV AH, 09h                   
INT 21H 
mov ah, 02
mov dl, 0ah
int 21h   
mov ah, 02
mov dl, 0ah
int 21h   
MOV AX,@DATA              
MOV DS, AX                       
LEA DX, msg6                    
MOV AH, 09h                   
INT 21H 
mov ah, 02
mov dl, 0ah
int 21h    
MOV AX,@DATA              
MOV DS, AX                       
LEA DX, msg7                    
MOV AH, 09h                   
INT 21H    
	
	mov ah, 4ch
	int 21h
	main endp
	end main
