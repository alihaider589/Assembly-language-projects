.model small

.stack 100h

.data

filename    db 'buff.txt',0
filehandler dw ?
buffer      db 300 dup ('$')

.code
main proc

;INITIALIZE DATA SEGMENT.
  mov  ax, @data
  mov  ds, ax                 

  call read_middle                     ;<==============

;WAIT FOR ANY KEY.    
  mov  ah, 7
  int  21h

;FINISH PROGRAM.
  mov  ax, 4c00h
  int  21h

;-----------------------------------------

read_middle proc

;OPEN FILE.
  mov  ah, 3dh          ;SERVICE TO OPEN FILE.
  mov  al, 0            ;OPEN AS READ ONLY.
  lea  dx, filename           
  int  21h  
  mov  filehandler, ax  ;NECESSARY FOR OPERATIONS ON FILE.



;READ ONE CHAR FROM CURRENT FILE POSITION.
  mov  ah, 3fh          ;SERVICE TO READ FROM FILE.
  mov  bx, filehandler
  mov  cx, 200            ;HOW MANY BYTES TO READ.
  lea  dx, buffer       ;WHERE TO STORE THE READ BYTES.  
  int  21h

  
mov dx, offset buffer
mov ah, 9
int 21h


;CLOSE FILE.
  mov  ah, 3eh          ;SERVICE TO CLOSE FILE.
  mov  bx, filehandler 
  int  21h


  
  ret
read_middle endp

;-----------------------------------------




main endp
end main