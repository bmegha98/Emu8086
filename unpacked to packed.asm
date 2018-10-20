;OBJECTIVE: TO CONVERT 16 DIGIT UNPACKED BCD NUMBER TO PACKED BCD NUMBER. 

DATA SEGMENT   
;INITIALIZATION OF VARIABLES

    X DD 01020304H,05060708H            ;UNPACKED BCD NUMBER
    Y DD ?                              ;PACKED BCD NUMBER
    
DATA ENDS 

CODE SEGMENT                            ;CODE SEGMENT STARTS
    
    ASSUME CS:CODE DS:DATA              ;ASSOCIATES CODE SEGMENT WITH CS AND DATA SEGMENT WITH DS
    
START:                                  ;START OF PROGRAM  
                                        
    MOV AX,DATA                         ;SEGMENT ADDRESS OF DATA SEGMENT IS LOADED INTO DS REGISTER
    MOV DS,AX 
    
    MOV SI,0                            ;TO ACCESS BYTES OF X
    MOV DI,3                            ;TO ACCESS BYTES OF Y
    MOV CX,2                            ;COUNTER IS SET TO 2
    
NEXT:                                   ;LOOP TO CONVERT UNPACKED BCD NUMBER
    MOV AX,X[SI]                        ;TO PACKED BCD NUMBER
    ADD SI,2
    MOV DX,X[SI]
    ADD SI,2
    
    SHL AL,4
    SHR AX,4 
    
    SHL DL,4
    SHR DX,4 
    MOV BYTE PTR Y[DI],DL
    DEC DI
    MOV BYTE PTR Y[DI],AL 
    DEC DI
    
    LOOP NEXT                           ;CX IS DECREMENTED BY 1
    
CODE ENDS                               ;CODE SEGMENT ENDS
END START                               ;END OF PROGRAM
