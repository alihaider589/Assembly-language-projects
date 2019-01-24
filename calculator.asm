.model small
.stack 100h
.386		
.data

strn db 10,9,9,9,"====================================$"
strm db 10,9,9,9,"*>>>>>>>>>>>Mini Project<<<<<<<<<<<*$"  
strs db 10,9,9,9,"*---------Simple Calculator--------*$"
stre db 10,9,9,9,"====================================$"
str1 db 10,10,9,9,9,"First Number: $"
str2 db 10,10,9,9,9,"Second number: $"
str3 db 10,10,"Enter a for addition, s for subtraction, m for multiplication or d for division: $"
str4 db 10,10,9,9,9,"Result is: $"
str5 db 10,10,9,9,9,"Incorrect Operator$"
str6 db 10,10,9,9,9,"Quotient: $"
str7 db 10,10,9,9,9,"Remainder: $"
str8 db 10,10,9,9,9,"Do you want to perform any other operation?(Y/N): $"
num1 db ?										
num2 db ?
operator db ?

.code
start:
mov ax,@data	 
mov ds,ax

mov al, 06h
mov ah, 00h
int 10h

mov ah, 0bh
mov bh, 00h
mov bl, 0
int 10h

mov ah,09
lea dx,strn	
int 21h

mov ah,09
lea dx,strm	
int 21h

mov ah,09
lea dx,strs	
int 21h

mov ah,09
lea dx,stre	
int 21h

lea dx,str1	
mov ah,09
int 21h

mov ah,01	 
int 21h
sub al,48	
mov num1,al	


lea dx,str2	
mov ah,09	
int 21h


mov ah,01	
int 21h
sub al,48	
mov num2,al	


lea dx,str3	
mov ah,09				
int 21h

mov ah,01	
int 21h
mov operator, al		
cmp al,'a'		
je addition			
cmp al,'s'
je subtraction		
cmp al,'m'
je multiplication		
cmp al,'d'
je division		
jne incorrect		


addition:			

mov al,num1		
mov bl,num2
mov ah,0
add al,bl		
aaa			

					
add al,48		
add ah,48				
mov bx,ax

lea dx,str4		
mov ah,09
int 21h

mov ah,02		
mov dl,bh
int 21h

mov ah,02				
mov dl,bl
int 21h

jmp opp		

subtraction:

mov al,num1		
mov bl,num2
mov ah,0
sub al,bl
aas			
add al,48
add ah,48
mov bx,ax

lea dx,str4			
mov ah,09
int 21h

mov ah,02
mov dl,bh
int 21h

mov ah,02
mov dl,bl
int 21h

jmp opp

multiplication:

mov al,num1
mov bl,num2	
mov ah,0	
mul bl		
aam		


add al,48	
add ah,48			
mov bx,ax	

lea dx,str4
mov ah,09
int 21h

mov ah,02
mov dl,bh
int 21h

mov ah,02
mov dl,bl
int 21h
jmp opp

division:				 

mov ah,0
mov al,num1		   
mov bl,num2		
div bl  		
			

add al,48 		
add ah,48
mov bx,ax

mov ah,09
lea dx,str4
int 21h

lea dx,str6   
int 21h

mov ah,02
mov dl,bl	

int 21h

lea dx,str7
mov ah,09
int 21h

mov ah,02
mov dl,bh		
int 21h


jmp opp


opp:
mov ah,09					
lea dx, str8
int 21h

mov ah, 01				
int 21h
cmp al, 'Y'
je start

cmp al, 'y'
je start

cmp al, 'N'
jmp exit

cmp al, 'n'
jmp exit


incorrect:
mov ah,09
lea dx,str5
int 21h
jmp opp


exit:
mov ah,4ch
int 21h

end start