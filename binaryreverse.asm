.model small
.stack 100h
.data 
orig db ? 
alt db ? 
ms db 'type binary$'
 ms1 db 'number :$'
 ms2 db 'in HEX:$' 
 ms3 db 'reverse:$'
 .code
start:
mov ax, @data
mov ds, ax
 mov ah,09h
 lea dx,ms 
 int 21h
 xor ax,ax
 xor bx,bx
 xor cx,cx
 xor dx,dx
 ;clear all the registers 
 mov ah,2
 mov dl,0dh
 int 21h
 mov ah,2
 mov dl,0ah
 int 21h
 MOV Bl, 0 
 mov AH,1
 star:
 INT 21h
 cmp Al, 0dh 
 je en
 RCR al,1
 RCR Bl,1
 jmp star 
 en:
 ;----------------------------------
 mov alt,bl
 mov cx,8 
 l1:
 rcr bl,1 
 rcl dl,1
 loop l1
 mov orig,dl
 ;---------------------------------- for new line 
 mov AH, 2 
 mov dl, 0ah 
 INT 21h
 mov dl, 0dh
 int 21h 
mov ax, @data
mov ds, ax
 mov ah,09h
 lea dx,ms1
 int 21h
 xor ax,ax 
 xor bx,bx 
 xor cx,cx
 xor dx,dx
 ;clear all the registers 
 mov bl,orig
 ;---------------------------------- 
 mov cx,8
 mov ah,2
 disp_ch:
 RCL Bl, 1 
 JNC L0 
 mov Dl, 31h
 jmp skip_
 L0:
 mov DL, 30h
 skip_: 
 INT 21h
 loop disp_ch 
 ;---------------------------------- 
 mov AH, 2
 mov dl, 0ah
 INT 21h
 mov dl,0dh 
 int 21h 
 mov ax, @data
mov ds, ax
 mov ah,09h
 lea dx,ms3
 int 21h 
 
 
 ;---------------------------------- 
 mov bl,alt
 ;---------------------------------- 
 mov cx,8 
 mov ah,2 
 disp_c: 
 RCL Bl, 1 
 JNC L2 
 mov Dl, 31h 
 jmp skp_ 
 L2:
 mov DL, 30h 
 skp_:
 INT 21h 
 loop disp_c
 mov ah, 4ch
 int 21h
end start