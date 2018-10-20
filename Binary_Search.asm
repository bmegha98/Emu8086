;OBJECTIVE : TO SEARCH AN ELEMENT AND RETURN ITS POSITION USING BINARY SEARCH

DATA SEGMENT 
;INITIALIZATION OF VARIABLES

    ARRAY DB 12H,34H,56H,67H,78H,86H,98H        ;ARRAY OF ELEMENTS IN ASCENDING ORDER
    FIRST DW 0H                                 ;START INDEX OF SEARCHING
    LAST DW 6H                                  ;END INDEX OF SEARCHING
    X DB 12H                                    ;ELEMENT TO BE SEARCHED
    POS DW -1                                   ;POSITION AT WHICH ELEMENT IS FOUND
    
DATA ENDS

CODE SEGMENT                                    ;CODE SEGMENT STARTS
    
    ASSUME CS:CODE DS:DATA                      ;ASSOCIATES CODE SEGMENT WITH CS AND DATA SEGMENT WITH DS
    
START:
    MOV AX,DATA                                 ;SEGMENT ADDRESS OF DATA SEGMENT IS LOADED INTO DS REGISTER
    MOV DS,AX
    
NEXT:                                           
    MOV AX,FIRST                                ;WHILE FIRST<=LAST
    MOV BX,LAST                                 ;AX=(FIRST+LAST)/2
    CMP AX,BX                                   ;IF FIRST>LAST EXIT
    JA NOTFOUND
    ADD AX,BX
    SHR AX,1                                   
    
    MOV SI,AX                                   ;MOV AX TO SI
    MOV CL,X                                    ;MID-ELEMENT= ARRAY[SI]
    
    CMP CL,ARRAY[SI]                            ;IF X==MID-ELEMENT
    JZ FOUND                                    ;JUMP TO FOUND
    JB BELOW                                    ;IF X<MID-ELEMENT JUMP TO BELOW
    JA ABOVE                                    ;ELSE JUMP TO ABOVE
    
FOUND:
   MOV POS,SI                                   ;ELEMENT IS FOUND AND ITS POSITION IS STORED INTO POS
   HLT
    
BELOW:
    DEC SI                                      ;DECREMENT SI AND  
    MOV LAST,SI                                 ;LAST=SI
    JMP NEXT                                    ;CONTINUE USING LOOP
    
ABOVE:
    INC SI                                      ;INCREMENT SI
    MOV FIRST,SI                                ;FIRST=SI
    JMP NEXT                                    ;CONTINUE USING LOOP

NOTFOUND:
    HLT                                         ;ELEMENT IS NOT IN THE LIST
    
CODE ENDS                                       ;CODE SEGMENT ENDS
END START                                       ;PROGRAM ENDS
