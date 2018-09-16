; OBJECTIVE : WORD ARITHMETIC

DATA SEGMENT  
    
; VARIABLES INITIALIZATION

    X DW 1234H
    Y DW 0001H
    Z DW 2345H
    result DW ?
    
DATA ENDS 

CODE SEGMENT  
    
    ASSUME CS:CODE  DS:DATA 
    
    START:  
  
 ; MOVING ADDRESS OF DATA TO DS(DATA SEGMENT)
     
     MOV AX,DATA
     MOV DS,AX
  
  ; EVALUATING EXPRESSION X+Y+24-Z
    
     MOV AX,X
     ADD AX,Y
     ADD AX,2411H
     SUB AX,Z
     MOV result,AX        ; Final Result is in result variable
     
CODE ENDS

END START
    

