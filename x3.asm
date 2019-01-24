.model small
.stack 100h
.data 
a dw ? 
val db ? 
.code 
start:
mov ah,1 
int 21h
 mov cx,ax
 mov ch,00h
 sub cl,48 
 label1:
 mov a,cx
 label2:
 inc bl
 loop label2
 mov cx,a
 loop label1
 mov val,bl 
 mov bl,val
 cmp bl,0Ah
 jb labely 
 je ub 
 cmp bl,14h
 jl labele 
 cmp bl,1Eh 
 jl ub1
 cmp bl,28h
 jl ub2 
 cmp bl,32h
 jl ub3 
 jmp end_ 
 labely:
 mov ah,2
 mov dl,0ah 
 int 21h 
 mov ah,2
 add bl,30h
 mov dl,bl
 int 21h 
 jmp end_
 ub:
 mov ah,2
 mov dl,0ah
 int 21h 
 mov ah,2
 mov dl,'1'
 int 21h
 add bl,26h
 mov ah,2 
 mov dl,bl 
 int 21h 
 jmp end_

 labele:
 mov ah,2 
 mov dl,0ah 
 int 21h 
 mov ah,2
 mov dl,'1'
 int 21h
 mov ah,2
 add bl,26h
 mov dl,bl
 int 21h 
 jmp end_
 ub1:
 mov ah,2
 mov dl,0ah
 int 21h
 mov ah,2
 mov dl,'2'
 int 21h
 mov ah,2
 add bl,1ch
 mov dl,bl
 int 21h
 jmp end_
 ub2: 
 mov ah,2 
 mov dl,0ah
 int 21h 
 mov ah,2
 mov dl,'3'
 int 21h 
 mov ah,2
 add bl,12h
 mov dl,bl
 int 21h
 jmp end_
 jmp end_
 ub3: 
 mov ah,2
 mov dl,0ah
 int 21h 
 mov ah,2
 mov dl,'4'
 int 21h 
 mov ah,2
 add bl,8h

 mov dl,bl
 int 21h 
 jmp end_ 
 jmp end_ 
 end_:
mov ah, 4ch
int 21h
end start