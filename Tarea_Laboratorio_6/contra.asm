; Hacer un programa que permita utilizar una clave de acceso
; condiciones adicionales:
; Almacene una contraseña de 5 caracteres en la memoria (usando una celda o una variable)
; el usuario debe digitar la clave y despues oprimir la tecla enter para validar
; si la clave es correcta el programa debe parar y mostrar el texto "BIENVENIDO"
; Si la clave es incorrecta el programa debe parar y mostrar el texto "INCORRECTO"


; LEER UNA CADENA DE TEXTO DESDE TECLADO Y ESCRIBIRLA EN LA CONSOLA DE MS-DOS
; MAIN
	org 	100h

	section	.text

        xor AX, AX
        xor SI, SI
        xor BX, BX
        XOR CX, CX
        xor DX, DX
        xor BP, BP

        MOV SI, 0
        MOV DI, 0d
        call    modotexto
        call    movercursor
        call    escribirMensaje
        call    movercursordos
	call 	LeerCadena
        call    movercursortres
	call	Compararcontra
        
	call 	EsperarTecla
        
        int 20h
	

	section	.data

msg1    db      "julio$"
msg2	db	"Ingrese su password ", "$"
msg3 	db 	"BIENVENIDO", "$"
msg4    db      "INCORRECTO" , "$"
frase 	times 	20  	db	" " 

; FUNCIONES

modotexto: 
        MOV AH, 0h ; activa modo texto
        MOV AL, 03h ; modo gráfico deseado, 03h denota un tamaño de 80x25 (80 columnas, 25 filas)
        INT 10h
        RET

movercursor:
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
escribirMensaje: ;utilizando interrupcion DOS
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, msg2 ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h
        RET

escribircadena: ;utilizando interrupcion DOS
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, BP ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h
        RET

; Permite leer un carácter de la entrada estándar
; Parámetros:   AH: 07h         
; Salida:       AL: caracter ASCII leído
EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret

; Leer cadena de texto desde el teclado
; Salida:       SI: longitud de la cadena
LeerCadena:
        xor     SI, SI          ; SI = 0
while:  
        call    EsperarTecla    ; retorna un caracter en AL
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      exit            ; si AL == EnterKey, saltar a exit
        mov     [BP+SI], AL   	; guardar caracter en memoria
        inc     SI              ; SI++
        jmp     while           ; saltar a while
exit:
	mov 	byte [BP+SI], "$"	; agregar $ al final de la cadena
        ret


Compararcontra:
       
       mov     AL, [BP]
       mov     BL, [msg1]
       cmp     AL,BL
       je      welcome
       jmp     fail


welcome: ;utilizando interrupcion DOS
        
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, msg3 ; cadena que vamos a imprimir
        INT 21h
        RET

fail: ;utilizando interrupcion DOS
        
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, msg4 ; cadena que vamos a imprimir
        INT 21h
        RET