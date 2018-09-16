; OBJECTIVE : BYTE ARITHMETIC

DATA SEGMENT  
    
; VARIABLES INITIALIZATION

    X DB 12H
    Y DB 43H
    Z DB 54H
    result DB ?
    
DATA ENDS 

CODE SEGMENT  
    
    ASSUME CS:CODE  DS:DATA 
    
    START:  
  
 ; MOVING ADDRESS OF DATA TO DS(DATA SEGMENT)
     
     MOV AX,DATA
     MOV DS,AX
  
  ; EVALUATING EXPRESSION X+Y+24-Z
    
     MOV AL,X
     ADD AL,Y
     ADD AL,24H
     SUB AL,Z
     MOV result,AL         ; Final Result is in result variable
     
CODE ENDS

END START
    
