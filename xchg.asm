.8086
.model small
.stack 100
.data
arr1 db "abcdefghijklmnopqrstuvwxyz", 0AH, 0DH, "$"
arr2 db "HelloWorld!", 0Ah, 0dh, "$"

.code
start:
mov ax, @data
mov ds, ax
mov es, ax

mov dx, offset arr1
mov ah, 09h
int 21H
mov dx, offset arr2
mov ah, 09h
int 21H

mov si, offset arr1
mov di, offset arr2
mov cx, 0AH
call exchange

mov dx, offset arr1
mov ah, 09h
int 21H
mov dx, offset arr2
mov ah, 09h
int 21H

mov ah, 4ch
int 21H

;Assuming that starting address of source block, starting address of destination block and size of block is in si, di and cx
exchange proc
pushf
push si
push di
push cx
push ax
block_copy:
mov al, [si]
mov ah, [di]
mov [di], al
mov [si], ah
inc si
inc di
LOOP block_copy
pop ax
pop cx
pop di
pop si
popf
ret
endp

end start

