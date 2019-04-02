.8086
.model small
.stack 100
.data
arr db "ABZ$"
.code
start:
mov ax, @data
mov ds, ax

mov dx, offset arr
mov ah, 09h
int 21h

mov si, offset arr
mov cx, 01h
call add_byte

mov dx, offset arr
mov ah, 09h
int 21h

mov ah, 4ch
int 21h

;Adds two number of cx number of bytes starting from ds:si and store the result
;in next memory location
add_byte proc
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
end start
