        org 100h

        section.text

        mov byte [200h], "J"
        mov byte [201h], "E"
        mov byte [202h], "V"
        mov byte [203h], "E"


        mov [200h, AX]
        mov [201h,BX]
        mov CX, [BX]
        mov DX, [BX + DI]


        int 20h
