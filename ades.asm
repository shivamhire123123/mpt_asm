.8086
.model small
.stack 100
.data
arr db "749301$"
new_line db 0ah, 0dh, "$"
.code
start:
mov ax, @data
mov ds, ax

mov dx, offset arr
mov ah, 09h
int 21h

mov dx, offset new_line
mov ah, 09h
int 21h

mov si, offset arr
mov cx, 06h
call asc_sort

mov dx, offset arr
mov ah, 09h
int 21h

mov dx, offset new_line
mov ah, 09h
int 21h

mov si, offset arr
mov cx, 06h
call des_sort

mov dx, offset arr
mov ah, 09h
int 21h

mov al, 00h
mov ah, 4ch
int 21h
int 3

;assuming starting address of block to be sort and size of block is in ds:is and cx
asc_sort proc
	dec cx
	push si
	push cx
	asc_sort_again:
		mov al, [si]
		cmp al, [si + 1]
		jb asc_skip_swap
			mov al, [si]
			mov bl, [si + 1]
			mov [si], bl
			mov [si + 1], al
			pop cx
			pop si
			push si
			push cx
			jmp asc_sort_again
		asc_skip_swap:
		inc si
	loop asc_sort_again
	pop cx
	pop si
	ret
endp

;assuming starting address of block to be sort and size of block is in ds:is and cx
des_sort proc
	dec cx
	push si
	push cx
	des_sort_again:
		mov al, [si]
		cmp al, [si + 1]
		ja des_skip_swap
			mov al, [si]
			mov bl, [si + 1]
			mov [si], bl
			mov [si + 1], al
			pop cx
			pop si
			push si
			push cx
			jmp des_sort_again
		des_skip_swap:
		inc si
	loop des_sort_again
	pop cx
	pop si
	ret
endp

end start
