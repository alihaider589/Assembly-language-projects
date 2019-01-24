.MODEL SMALL
 .STACK 100H

 .DATA
   msg_1  DB  'Enter the binary number: $'
   msg_2  DB  0DH,0AH,'The equivalent Hexadecimal number is : $'
   ILLEGAL   DB  0DH,0AH,'invalid selection. Try again : $'
 
 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     LEA DX, msg_1             ; load and display the string PROMPT_1
     MOV AH, 9
     INT 21H

     JMP @START_2                 ; jump to label @START_2 

     @START_1:                    ; jump label
       LEA DX, ILLEGAL            ; load and display the string ILLEGAL
       MOV AH, 9
       INT 21H

       XOR BX, BX                 ; clear BX
       MOV DH, 0                  ; initialize DH with 0

     @START_2:                    ; jump label
       MOV AH, 1                  ; read a character 
       INT 21H

       CMP AL, 0DH                ; comapre Al with CR
       JNE @SKIP                  ; jump to label @SKIP if AL!=CR

       CMP DH, 1                  ; compare DH with 1
       JB @START_1                ; jump to label @START_1 if DH<1
       JMP @END                   ; jump to label @END

       @SKIP:                     ; jump label

       INC DH                     ; increment DH by 1
       AND AL, 0FH                ; convert the ascii into decimal code

       CMP AL, 0                  ; compare AL with 0
       JB @START_1                ; jump to label @START_1 if AL<0

       CMP AL, 1                  ; compare AL with 1
       JA @START_1                ; jump to label @START_1 if AL>1

       SHL BX, 1                  ; shift BX towards left by 1 position
       OR BL, AL                  ; set the LSB of BL by AL

       CMP DH, 16                 ; compare DH with 16
       JE @END                    ; jump to label @END if DH=16
       JMP @START_2               ; jump to label @START_2

     @END:                        ; jump label

     LEA DX, msg_2             ; load and display the string PROMPT_2
     MOV AH, 9
     INT 21H

     MOV CX, 4                    ; initialize loop counter
     MOV AH, 2                    ; set output function

     @LOOP_1:                     ; loop label
       XOR DX, DX                 ; clear DX

       @LOOP_2:                   ; jump label
         SHL BX, 1                ; shift BX towards left by 1 position
         RCL DL, 1                ; rotate DL towards left by 1 position
         INC DH                   ; increment DH
         CMP DH, 4                ; compare DH with 4
       JNE @LOOP_2                ; jump to label @LOOP_2 if DH!=4

       CMP DL, 9                  ; compare DL with 9
       JBE @NUMERIC_DIGIT         ; jump to label @NUMERIC_DIGIT if DL<=9
       SUB DL, 9                  ; convert it to number i.e. 1,2,3,4,5,6
       OR DL, 40H                 ; convert number to letter i.e. A,B...F
       JMP @DISPLAY               ; jump to label @DISPLAY

       @NUMERIC_DIGIT:            ; jump label
         OR DL, 30H               ; convert decimal to ascii code

       @DISPLAY:                  ; jump label
         INT 21H                
     LOOP @LOOP_1                 

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP
 END MAIN 