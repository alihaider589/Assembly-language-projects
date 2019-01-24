.model small
.stack 100h 
.data 
msg db 10,10,10,10,10,10,10,10,10,9,9,'Enter Password Please $' 
password db 'talha ' 
correct db 10,10,10,10,10,10,10,10,10,9,9, ' Password is correct $ ' 
Incorrect db 10,10,10,10,10,10,10,10,10,9,9, 'Password is incorrect$'

.code 
start: 
mov ax,@data
mov ds,ax
mov al,06h
mov ah,00h
int 10h
 mov ah,0bh
 mov bh,00h
 mov bl,9
 int 10h
mov cx,5
mov bx,offset password
mov dx,offset msg 
 mov ah,09
Int 21h 
again: 

mov ah,08 
Int 21h 
cmp al,[bx]
jne error
inc bx 
loop again 
mov al,06h
mov ah,00h
int 10h
 mov ah,0bh
 mov bh,00h
 mov bl,10
 int 10h
mov ah,09
mov dx,offset correct
int 21h 
jmp over 
error:
mov al,06h
mov ah,00h
int 10h
 mov ah,0bh
 mov bh,00h
 mov bl,12
 int 10h
mov dx,offset incorrect
mov ah,09
Int 21h 
over:
mov ah,4ch
int 21h
end start
