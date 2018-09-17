; OBJECTIVE : ADDING ELEMENTS OF A BYTE ARRAY

DATA SEGMENT      
 
; VARIABLES INITIALIZATION

    ARRAY DB 01H,02H,03H,04,05H 
    SIZE DW 05H
    SUM DB ?
    
DATA ENDS
       
CODE SEGMENT
    
    ASSUME CS:CODE DS:DATA
    
    START:
    
    MOV AX,DATA
    MOV DS,AX
    
    MOV AL,0
    MOV SI,0   
    MOV CX,SIZE
BEGIN:     
    ADD AL,ARRAY[SI]
    INC X
LOOP BEGIN
                 
    MOV SUM,AL
    
CODE ENDS

END START

