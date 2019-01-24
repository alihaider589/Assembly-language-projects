.MODEL SMALL
.stack 100h
 .DATA
 str1 DB 0DH,0AH,"ENTER A STRING:$"
 CUL DB 30H
 S DB 30H 
 CUP DB 30H
 D DB 30H 
 SUMMARY DB 0DH,0AH,":SUMMARY:$"
 SPCL DB 0DH,0AH,"SPECIAL CHARACTERS:$" 
 UPPR DB 0DH,0AH,"UPPAR-CASE:$" 
 LOWR DB 0DH,0AH,"LOWER-CASE:$"
 DIGITS DB 0DH,0AH,"DIGITS:$" 
 .CODE 
 start:
 mov ax, @data           ;calling data in ax
 mov ds, ax             ;inserting ax data in data segement register
 LEA DX,str1          ;loading ENTER in dx register
 MOV AH,09              ;printing string by mov ah function
 INT 21H 
 ABC:                   ;new label abc
 MOV AH,01H             ;taking string input 
 INT 21H                 ;interupt calling to stop on screen
 CMP AL,0DH              ;comparing AL and 0DH string till new line start 
 JE RESULT              ;if al = ODH jump to RESULT
 CMP AL," "             ;compare AL with " Black space"
 JE SPECIAL             ; if al = "blank space " move to SPECIAL 
 CMP AL,","             ;compare al with ",(comma)" 
 JE SPECIAL             ;if al= "comma" jump to special
 CMP AL,"."             ;compare Al with '.dot'
 JE SPECIAL             ;if al is equal to .dot jump to special
 CMP AL,39H             ;compare AL with single cotation 
 JLE T                  ;if al is equal to single cotation jump to T
 CMP AL,61H             ; compare AL with equal sign 
 JGE R                  ;if al is equal to equal sign jump to R 
 CMP AL,41H             ;if al is equal to right paren ")" 
 JGE UPPER              ;if Fal is equal to right paren jump to upper 
 CMP AL,0DH             ;comparing al space
 JE RESULT              ;if result is equal to space jump to result 
 SPECIAL:                   ;Special label 
 INC S                  ;ab jo bhi value speical character mai aye gi us ko increment karwadega
                        
 JMP ABC                ;jump krrha h abc PR    

 T:
 CMP AL,30H             ;AScii code of 0
 JGE DIG1               ;if its greater than or equal to 0 then jump to DIG 
 JMP ABC                ;if not jump and greater than it will jump to ABC 
 DIG1:                          
 INC D                          ;it will increase vaue of D which is by default 0+1
 JMP ABC                        ; after increment it will jump to ABC 
 UPPER:                         ;upper label
 CMP AL,5AH                     ;compare value of al from z 
 JLE P1                           ;if its equal jump to P1; if not jump to ABC
 JMP ABC                        ;
 P1:
 INC CUP                        ;incrementing cup
 JMP ABC                         ;after incrementing CUP jump to ABC
 R: 
 CMP AL,7AH                             
 JLE L1 
 
 JMP ABC 
 L1:
 INC CUL
 JMP ABC
 RESULT:
 mov ax, @data              ;ax kai ander data ki call krwaya 
 mov ds, ax                 ; ax ko data segment kai ander dala 
 MOV AH,09H                 ;print string 
 LEA DX,SUMMARY             ;summary ko dx mai krwa rha h 
 INT 21H 
 JMP A1
 A1:
 mov ax, @data
 mov ds, ax
 MOV AH,09H
 LEA DX,UPPR
 INT 21H
 MOV AH,02H 
 MOV DL,CUP 
 INT 21H 
 JMP A2
 A2:
 mov ax, @data
 mov ds, ax
 MOV AH,09H
 LEA DX,LOWR 
 INT 21H
 MOV AH,02H
 MOV DL,CUL
 INT 21H 
 JMP A3
 A3: 
 mov ax, @data
 mov ds, ax
 MOV AH,09H
 LEA DX,DIGITS
 INT 21H
 MOV AH,02H
 MOV DL,D 
 INT 21H
 JMP A4
 A4: 
 mov ax, @data              
 mov ds, ax
 MOV AH,09H
 LEA DX,SPCL                    ;special ko dx mai dal rha h 
 INT 21H                        
 MOV AH,02H                         ;printing charaters
 MOV DL,S                           
 INT 21H
 JMP END_P 
 END_P: 
 mov ah, 4ch 
 int 21h
 end start
