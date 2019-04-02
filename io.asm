.8086
.model small
.stack 100
.data
	ent_num db "Enter a number: $"
	nw_line db 0ah, 0dh, "$"
	num_ent db "Number entered is: $"
.code
main:
	mov ax, @data
	mov ds, ax

	mov dx, offset ent_num
	mov ah, 09h
	int 21h

	call get_digit
	push ax

	mov dx, offset nw_line
	mov ah, 09h
	int 21h

	mov dx, offset num_ent
	mov ah, 09h
	int 21h

	pop ax
	mov dl, al
	call put_digit

	mov ah, 4ch
	int 21h
;following code get a number(0-9)(assuming user have type a number) from stdin
;and convert it to hex
;return al = number entered
get_digit proc
	push ax
	mov ah, 01h
	int 21h

	sub al, 30h
	mov ah, [si + 1]
	add sp, 02h
	ret
endp
;This function gets a number(at most 32 bit) ended by space or enter(return)
;from stdin
;return dx:ax
get_num proc
	push bx
	push cx
	mov bx, 00h
	mov ax, 00h
	get_next_digit:
		push ax
		call get_digit
		cmp al, " "
		je end
		cmp al, 0ah
		je end
		mov bl, al
		pop ax
		mov cx, 000ah
		mul cx
		add ax, bx
		jmp get_next_digit
	end:
		pop ax
		pop bx
		pop cx
		ret
endp
;following code output a number in dl(0-9) to stdout
;register used - dl
;input dl -> number to be printed
;return al = last character output
put_digit proc
	push ax
	add dl, 30h
	mov ah, 02h
	int 21h
	pop ax
	ret
endp

put_num proc
	push dx
	push ax
	put_next_digit:
		d
end main
