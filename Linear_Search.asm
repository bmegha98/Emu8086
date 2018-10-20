;OBJECTIVE :TO SEARCH AN ELEMENT AND RETURN ITS POSITION USING LINEAR SEARCH.

DATA SEGMENT 
;INITIALIZATION OF VARIABLES

    ARRAY DB 56H,43H,98H,23H,76H        ;BYTE ARRAY-> LIST OF ELEMENTS
    SIZE DW 5H                          ;SIZE OF ARRAY
    X DB 23H                            ;ELEMENT TO BE SEARCHED
    POS DW -1                           ;POSITION AT WHICH ELEMENT IS FOUND
    
DATA ENDS          

CODE SEGMENT                            ;CODE SEGMENT STARTS
    
    ASSUME CS:CODE DS:DATA              ;TELLS ASSEMBLER THAT CODE SEGMENT IS ASSOCIATED WITH CS AND DATA SEGMENT IS ASSOCIATED WITH DS  
    
START:                                  ;START OF PROGRAM EXECUTION

    MOV AX,DATA                         ;SEGMENT ADDRESS OF DATA SEGMENT IS LOADED INTO DS REGISTER
    MOV DS,AX  
    
    MOV SI,0                            ;SI IS CLEARED
    
NEXT:                                   ;LOOP TO SEARCH ELEMENT X STARTS

   MOV AL,ARRAY[SI] 
   CMP AL,X                             ;COMPARE EACH ELEMENT OF ARRAY WITH X AND
   JZ CHECK                             ;IF BOTH ARE EQUAL JUMP TO CHECK LABEL ELSE
   INC SI                               ;INCREMENT SI
   LOOP NEXT                            ;AND CONTINUE WITH THE LOOP
   
CHECK:
  CMP SI,SIZE                           ;CHECK IF SI>=SIZE
  JAE EXIT                              ;ELEMENT IS NOT IN THE LIST AND EXIT
  JB FOUND                              ;ELSE JUMP TO FOUND
  
FOUND:
 MOV POS,SI                             ;MOV POSITION OF ELEMENT TO POS
 HLT                                    ;AND HALT THE EXECUTION
 
EXIT:
 HLT   
 
CODE ENDS                               ;CODE SEGMENT ENDS
END START                               ;END OF PROGRAM
