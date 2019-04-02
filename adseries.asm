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
	;Adds two number of cx number of bytes starting from ds:si and store the result
	;in next memory location
	add_byte proc
		push 
		mov di, si
		add di, cx
		mov bx, di
		add bx, cx
		clc
		add_again:
			mov al, [si]
			adc al, [di]
			mov [bx], al
			dec cx
		jnz add_again
	ret
	endp
end main
