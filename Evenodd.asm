.model small
.stack 100h
.data
     msg1 db 0ah,0dh, "Enter any Number :  $"
     msg2 db 0ah,0dh, "This Number is Even $"
     msg3 db 0ah,0dh, "This Number is Odd $"
.code
  start:
           mov ax,@data
           mov ds,ax
                            
           mov ah,09
           lea dx,msg1
           int 21h              
           mov ah,01
           int 21h
           int 21h
           cwd

           mov bx,2
           div bx

           cmp dx,0h
           je even_no
           jne odd

           even_no:
           mov ah,9h
           lea dx,msg2
           int 21h
           jmp exit

           odd:
           mov ah,9h
           lea dx,msg3
           int 21h

           exit:
           mov ah,4ch
           int 21h


end