.8086
.model small
.stack 100
.data
.code
main:
	mov ax, @data
	mov ds, ax



	mov ah, 4ch
	int 21h
end main
