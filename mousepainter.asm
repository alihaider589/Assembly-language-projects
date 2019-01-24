.model small
.stack 100h
.data
.code
start:

    mov al,13h 
    mov ah,0  	;initialize graphic mode
    int 10h

    mov ax, 0	;initialize mouse
    int 33h

    mov ax,1	;show mouse
    int 33h

    
start1:
    mov ax,3	;position of mouse by row & column
    int 33h

    call putpix		;function call
    jmp start1
    putpix proc		;function declear
    mov al,1100b	;set color
    mov ah,0ch		;print
    shr cx,1		;shift bit into right
    int 10h		;print color
    ret
        putpix endp

mov ah,4ch
int 21h
end start