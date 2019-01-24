.model small
.stack 100h 
.data
 
 msg db " vowel$" 
 ms db " consonant$" 
 .code
 start:
 mov ah,01 
 int 21h
 cmp al,97 
 jz if_
 cmp al,101 
 jz if_
 cmp al,105 
 jz if_ 
 cmp al,111
 jz if_
 cmp al,117 
 jz if_
 cmp al,65 
 jz if_
 cmp al,69 
 jz if_ 
 cmp al,73
 jz if_
 cmp al,79 
 jz if_
 cmp al,85 
 jz if_ 
 jmp else1
 if_: 
 mov ax,@data
 mov ds, ax
 lea dx,msg 
 mov ah,09 
 int 21h 
 jmp end1
 else1: 
 mov ax,@data
 mov ds, ax
  
 lea dx,ms 
 mov ah,09
 int 21h
 end1:
 mov ah, 4ch
 int 21h
 end start
