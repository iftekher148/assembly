
.MODEL SMALL
.STACK 100H
.DATA
 MSG DB 'ENTER STRING:', '$'
 X DB 80 DUB (?)
 
 .CODE
 MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     LEA DX,MSG
     MOV DX,9
     INT 21H
     
     MOV SI,0
     
     NEXT:
     MOV AH,1
     INT 21H
     CMP AL,0DH
     JZ EXIT
     MOV X[SI],AL
     INC SI
     JMP NEXT
     
     
     EXIT:
     DEC SI
     
     MOV AH,2
     MOV DL,0DH
     INT 21H
     MOV AH,2
     MOV DL,0AH
     INT 21H 
     
     NEXT2:
     
     MOV AH,2
     MOV DL,X[SI]
     INT 21H
     CMP SI,0
     JZ EXIT2 
     DEC SI
     JMP NEXT2
     
     
     EXIT2:
     MOV AH,4CH
     INT 21H
     MAIN ENDP
 END MAIN