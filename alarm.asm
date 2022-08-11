CLR P1.3
CLR P1.7
CLR P1.6
SETB P1.5
CLR P1.4
SETB P1.2
CLR P1.2
CALL delay

SETB P1.2
CLR P1.2
SETB P1.7
SETB P1.2
CLR P1.2
CALL delay

CLR P1.7
CLR P1.6
CLR P1.5
CLR P1.4
SETB P1.2

CLR P1.2
SETB P1.6
SETB P1.5
SETB P1.2
CLR P1.2
CALL delay

CLR P1.7
CLR P1.6
CLR P1.5
CLR P1.4
SETB P1.2
CLR P1.2
SETB P1.7
SETB P1.6
SETB P1.5
SETB P1.4
SETB P1.2
CLR P1.2
CALL delay

principal:
JNB P2.0, mensagem1
JNB P2.1, mensagem2
JNB P2.2, mensagem3
jmp principal

limpaDisp:
CLR P1.3
MOV 10h, #01h
CALL enviaMsg
call delay
RET

mensagem3:
CLR 10h
MOV 10H, #'Q';1
MOV 11H, #'U'
MOV 12H, #'A'
MOV 13H, #'R'
MOV 14H, #'T'
MOV 15H, #'O'
mOV 16H, #' '
MOV 17H, #' '
MOV 18H, #' '
MOV 19H, #' '
MOV 1AH, #0

jmp envio

mensagem2:
CLR 10h
MOV 10H, #'P';1
MOV 11H, #'O'
MOV 12H, #'R'
MOV 13H, #'T'
MOV 14H, #'A'
MOV 15H, #' '
mOV 16H, #' '
MOV 17H, #' '
MOV 18H, #' '
MOV 19H, #' '
MOV 1AH, #0

jmp envio

mensagem1:
CLR 10h
MOV 10H, #'J'
MOV 11H, #'A'
MOV 12H, #'N'
MOV 13H, #'E'
MOV 14H, #'L'
MOV 15H, #'A'
mOV 16H, #' '
MOV 17H, #' '
MOV 18H, #' '
MOV 19H, #' '
MOV 1AH, #0

envio:
SETB P1.3
MOV R1, #10H

loop:
MOV A, @R1
JZ especial
CALL enviaMsg
INC R1
JMP loop

enviaMsg:
MOV C, ACC.7
MOV P1.7, C
MOV C, ACC.6
MOV P1.6, C
MOV C, ACC.5
MOV P1.5, C
MOV C, ACC.4
MOV P1.4, C
SETB P1.2
CLR P1.2
MOV C, ACC.3
MOV P1.7, C
MOV C, ACC.2
MOV P1.6, C
MOV C, ACC.1
MOV P1.5, C
MOV C, ACC.0
MOV P1.4, C
SETB P1.2
CLR P1.2
CALL delay

delay:
MOV R0, #50
DJNZ R0, $
RET

especial:
CLR P1.3
call delay
call delay
LJMP principal
