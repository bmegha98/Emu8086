;OBJECTIVE: TO CONVERT 16 DIGIT PACKED BCD NUMBER TO UNPACKED BCD AND ITS ASCII VALUE. 

DATA SEGMENT  
;INITIALIZATION OF VARIABLES

    PNUM  DW 1234H,5678H,3452H,9876H        ;16 DIGIT PACKED BCD NUMBER
    UNUM  DD 4 DUP(?>                       ;UNPACKED NUMBER 
    ASCNUM DD 4 DUP(?)                       ;ASCII NUMBER
    
DATA ENDS 

CODE SEGMENT                            ;CODE SEGMENT STARTS
    
    ASSUME CS:CODE DS:DATA              ;ASSOCIATES CODE SEGMENT WITH CS REGISTER AND DATA SEGMENT WITH DS REGISTER
    
START:                                  ;START OF PROGRAM
    
    MOV AX,DATA                         ;SEGMENT ADDRESS OF DATA SEGMENT IS LOADED INTO DS REGISTER
    MOV DS,AX  
    
    MOV SI,0
    MOV DI,0  
    MOV CX,4                            ;COUNTER IS SET TO 4
                                        ;LOOP STARTS
NEXT:                                   ;THIS LOOP TAKES X WORD BY WORD
    MOV AL,BYTE PTR PNUM[SI]
    INC SI
    MOV DL,BYTE PTR PNUM[SI]               ;AND CONVERT IT INTO CORRESPONDING UNPACKED NUMBER
    INC SI 
    
    MOV AH,0
    MOV DH,0
    
    SHL AX,4                            ;AX IS LOGICALLY SHIFTED LEFT BY 4
    SHR AL,4                            ;AL IS LOGICALLY SHIFTED RIGHT BY 4
    SHL DX,4                            ;DX IS LOGICALLY SHIFTED LEFT BY 4
    SHR DL,4                            ;DL IS LOGICALLY SHIFTED RIGHT BY 4
    
    MOV WORD PTR UNUM[DI],AX
    ADD DI,2  
    
    MOV WORD PTR UNUM[DI],DX
    ADD DI,2 
    
LOOP NEXT                               ;CX IS DECREMENTED       

  MOV SI,0                              ;SI,DI AND CX ARE CLEARED AGAIN
  MOV DI,0
  MOV CX,4
                                        ;LOOP TO GET ASCII VALUE OF UNPACKED NUMBER
ASCII:  
  MOV AL,BYTE PTR UNUM[SI]
  INC SI
  ADD AL,30H
  MOV AH,BYTE PTR UNUM[SI]
  INC SI
  ADC AH,30H
  MOV DL,BYTE PTR UNUM[SI]
  INC SI
  ADC DL,30H
  MOV DH,BYTE PTR UNUM[SI]
  INC SI
  ADC DH,30H 
  
  MOV WORD PTR ASCNUM[DI],AX
  ADD DI,2
  
  MOV WORD PTR ASCNUM[DI],DX
  ADD DI,2
   
  LOOP ASCII                            ;LOOP ENDS
   

CODE ENDS                               ;CODE SEGMENT ENDS
END START
