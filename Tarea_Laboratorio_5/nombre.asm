org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d
    
    call modotexto
    call movercursoruno
    call escribirnombreuno
    call movercursordos
    call escribirnombredos
    call movercursortres
    call escribirapellidouno
    call movercursorcuatro
    call escribirapellidodos
    call esperartecla
    call exit

    modotexto: 
        MOV AH, 0h ; activa modo texto
        MOV AL, 03h ; modo gráfico deseado, 03h denota un tamaño de 80x25 (80 columnas, 25 filas)
        INT 10h
        RET
    movercursoruno:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 10 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        RET
    movercursordos:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 12 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        RET
    movercursortres:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 14 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        RET
    movercursorcuatro:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 16 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        RET
    escribirnombreuno: ;utilizando interrupcion DOS
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, nombreuno ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h
        RET
    escribirnombredos: ;utilizando interrupcion DOS
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, nombredos ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h
        RET
    escribirapellidouno: ;utilizando interrupcion DOS
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, apellidouno ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h
        RET
    escribirapellidodos: ;utilizando interrupcion DOS
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, apellidodos ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h
        RET

    esperartecla:
        MOV AH, 00h ; espera buffer del teclado para avanzar en la siguiente instrucción
        INT 16h

        ret
    exit:
        int 20h

section .data

nombreuno DB "Julio$"
nombredos DB "Eduardo$"
apellidouno DB "Ventura$"
apellidodos DB "Escamilla$"