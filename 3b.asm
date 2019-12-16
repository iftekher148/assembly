
.MODEL SMALL
.STACK 100H
.DATA
 ARR DB 70 DUP(?)
 A DB 'ENTER THE STRING:','$'
 B DB 'AFTER SORTING:','$'
 
 .CODE
 MAIN PROC
    MOV AX, @DATA
    MOV DS,AX
    
    LEA DX,A
    MOV AH,9
    INT 21H
    
    MOV CX,5
    N:
    
    MOV AH,1
    INT 21H 
    SUB AL,31H
    MOV ARR[SI],AL
    INC AL
    LOOP N
    
    ;FOR SORTING
    MOV CX,5
    MOV SI,0
    
    SORT:
    CMP CX,SI
    JZ NEXT
    
    MOV AL,ARR[SI]
    MOV BL,ARR[SI+1]
    
    CMP AL,BL
    JB EXCHANGE
    ADD SI,1
    JMP SORT
    
    EXCHANGE:
    MOV ARR[SI],BL
    MOV ARR[SI+1],AL
    ADD SI,1
    JMP SORT
    
    NEXT:
    MOV SI,0
    SUB CX,1
    CMP CX,0 ;DEC CX
    JNZ SORT            
                
    ;PRINT ARREY DESENDING ORDER
    MOV AH,9
    LEA DX,B
    INT 21H
    MOV CX,6
    MOV [SI],OFFSET ARRY
    MOV AH,2
    TOP:
    
    ADD ARR[SI],30H
    MOV DL,ARR[SI]
    INT 21H 
    INC SI
    LOOP TOP
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    END MAIN
    



