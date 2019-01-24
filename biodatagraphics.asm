.model small 
.stack 100h
.data
msg   db  "Student Information " ,13,10
	  db  "------------------------------",13,10
      db  "NAME   : ALI HAIDER",13,10 
      db  "F-NAME : Zafar Haider ",13,10 
      db  "BATCH  : 4D EVENING ",13,10 
      db  "ID     : CSC-17S-052 ",13,10 
      db  "SUBJECT: ASSEMBLY LANGUAGE",13,10
	  db  "TEACHER: MISS SEHAR "
	  db"                                                                                                "
       
.code
 start:
     mov ax, @data
    mov ds, ax

 ;set graphics mode
mov ax,6
int 10h

mov ah,0bh  
mov bh,00h 
mov bl,1 
int 10h




mov si,@data	


mov ah,02 ;set cursor 
mov bh,2 ;page 
mov dh,3 ;row
mov dl,1  ;column
int 10h
;print string in graphics mode
mov ah,13h
mov al,0

mov bh,0;page number=always zero
mov bl,0;color of the text 

mov cx,280
mov es,si
mov bp,offset msg
int 10h





mov ah,0ch
mov al,3

mov dx,10
mov cx,0
 

l1:
int 10h
inc cx
cmp cx,360
jle l1

mov dx,100
mov cx,0

l2:
int 10h
inc cx
cmp cx,640
jle l2



mov dx,10
mov cx,360
l4:
int 10h
inc dx
cmp dx,100
jle l4

mov ah,0
int 16h
mov ax,3
int 10h

mov ah,4ch
int 21h
end start