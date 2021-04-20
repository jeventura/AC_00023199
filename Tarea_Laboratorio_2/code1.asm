        org 	100h

	section	.text

	mov	AX, 8A4Fh
	mov	BH, 5Dh
	mov	CL, "A"

	mov	[200h], AX
	mov	[210h], BH
	mov	[220h], CL

	mov	byte [230h], 11d
	mov	byte [240h], "B"

	int	20h

; COMMANDOS DE DEBUG

; r = mostrar estado de los registros
; t = ejecutar una sola instruccion
; g = ejecutar todo
; d 200 = ver estado de memoria en la direccion 200
; q = salir

; ENSAMBLAR ARCHIVO
; nasm -f bin <nombre>.asm -o <output>.com

; ABRIR DOSBOX
; dosbox .

; DEBUGGEAR PROGRAMA EN DOS
; debug.exe <output>.com