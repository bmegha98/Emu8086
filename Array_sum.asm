;OBJECTIVE : TO ADD ELEMENTS OF A DOUBLE WORD ARRAY. 

DATA SEGMENT  
 ;INITIALIZATION OF VARIABLES
 
    ARRAY DD 12345678H,49872356H,FFFFFFFFH,33445511H,43871037H      ;DOUBLE WORD ARRAY
    SIZE DW 5H                                                      ;SIZE OF ARRAY
    SUM DD ?                                                        ;TO STORE SUM OF ARRAY
DATA ENDS    

CODE SEGMENT                            ;CODE SEGMENT STARTS
    
    ASSUME CS:CODE DS:DATA              ;ASSOCIATES CODE SEGMENT WITH CS AND DATA SEGMENT WITH DS
    
 START:                                 ;START OF PROGRAM EXECUTION
    
    MOV AX,DATA                         ;LOAD SEGMENT ADDRESS OF DATA INTO DS REGISTER 
    MOV DS,AX
    
    
    MOV AX,0                             ;CLEAR AX AND DX
    MOV DX,0
    MOV SI,0
    MOV CX,SIZE                         ;COUNTER IS SET TO SIZE OF THE ARRAY
    
NEXT:   
    ADD AL,BYTE PTR ARRAY[SI]           ;ADD FIRST BYTE OF ELEMENT TO AL
    INC SI                              ;AND INCREMENT SI BY 1
    ADC AH,BYTE PTR ARRAY[SI]           ;ADD SECOND BYTE OF ELEMENT AH
    INC SI                              ;AND INCREMENT SI BY 1
    ADC DL,BYTE PTR ARRAY[SI]           ;ADD THIRD BYTE OF ELEMENT TO DL
    INC SI                              ;INCREMENT SI BY 1
    ADC DH,BYTE PTR ARRAY[SI]           ;ADD FINAL BYTE OF ELEMENT TO DH
    INC SI                              ;SI IS INCREMENTED BY 1
    LOOP NEXT                           ;CX IS DECREMENTED BY 1 AND LOOP CONTINUES TILL CX BECOMES ZERO.
    
    MOV BYTE PTR SUM,AL
    MOV BYTE PTR SUM+1,AH               ;MOV CONTENT OF AX AND DX INTO SUM 
    MOV BYTE PTR SUM+2,DL
    MOV BYTE PTR SUM+3,DH
    
CODE ENDS                               ;CODE SEGMENT ENDS
END START                               ;END OF EXECUTION
