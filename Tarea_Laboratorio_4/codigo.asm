; GUARDAR EL ARREGLO PARES EN [0300h] Y EL ARREGLO IMPARES EN [0320h]
; MAIN
        org     100h

        section .text

        mov     BP, arrByte     ; BP = puntero a arrByte
        mov     BX, 200h        ; BX = dirección de guardado
        call    StoreArr        ; llama función

        mov     BP, arrWord     ; BP = puntero a arrWord
        mov     BX, 210h        ; BX = dirección de guardado
        call    StoreArr        ; llama función

        int     20h

        section .data

arrByte db      01,02,03,04,05,06,07,08,09,10,0xA                 ; arreglo de numeros byte empezando en dirección arrByte


; FUNCIONES

; función para guardar un arreglo
; BP: puntero a arreglo         BX: dirección de guardado
StoreArr:
        xor     SI, SI          ; SI = 0
while:  
        mov     AX, AL          ; AL = [puntero a arreglo + SI]
        mov     BL, 02h         ; [direccion de guardado + SI] = AL
        div     AL              ; SI++
        cmp     AH, 00h         ;
        mov     [BX + SI], AL   ;
        jmp     while           ; salta incondicionalente a while
end:    
        ret                     ; regresa a MAIN
        


