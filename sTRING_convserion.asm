
           .MODEL SMALL
.STACK 100H

.DATA
MSG DB 'PLEASE ENTER A STRING: ', '$'  
X DB 80 DUP (?) 

.CODE
MAIN PROC
    
MOV AX, @DATA  
MOV DS, AX  

LEA DX, MSG
MOV AH, 9 
INT 21H

MOV SI, 0
MOV AH, 1
NEXT:
INT 21H
CMP AL, 0DH
JZ EXIT
MOV X[SI], AL
INC SI
JMP NEXT

EXIT:  

MOV BX, SI
         
MOV AH, 2
MOV DL, 0DH
INT 21H
MOV DL, 0AH
INT 21H
                  
MOV SI, 0                  

NEXT2:
CMP X[SI], 'a'
JGE LOW
ADD X[SI], 32
JMP NRML
LOW:
SUB X[SI], 32 

NRML:
MOV DL, X[SI]
INT 21H      
CMP SI, BX
JZ EXIT2
INC SI
JMP NEXT2   

EXIT2:     
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN


