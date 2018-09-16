; OBJECTIVE : WORD ARITHMETIC(BYTE BY BYTE)

DATA SEGMENT
    
    ;VARIABLES INITIALIZATION

     X DW 1234H
     Y DW 0015H
     Z DW 4560H
     result DW ?
     
DATA ENDS

CODE SEGMENT
    
    ASSUME CS:CODE DS:DATA
        START:
         
        ; MOVING ADDRESS OF DATA TO DS(DATA SEGMENT) 
        
        MOV AX,DATA
        MOV DS,AX 
        
        ; EVALUATING EXPRESSION X+Y+1113H-Z
        
        MOV AL,BYTE PTR X;
        ADD AL,BYTE PTR Y;
        MOV AH,BYTE PTR X+1;
        ADC AH,BYTE PTR Y+1; 
        ADD AX,1113H
        SUB AL,BYTE PTR Z;
        SBB AH,BYTE PTR Z+1;
        MOV RESULT,AX;  
        
  CODE ENDS 

END START

        
        
