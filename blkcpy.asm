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
call memcpy

mov dx, offset arr1
mov ah, 09h
int 21H
mov dx, offset arr2
mov ah, 09h
int 21H

mov ah, 4ch
int 21H

;Assuming that starting address of source block, starting address of destination block and size of block is in si, di and cx
memcpy proc
pushf
push si
push di
push cx
CLD
cmp si, di
ja block_copy
;if si < di then start coping from final address of block else start coping from starting address of block
dec cx
add si, cx
add di, cx
inc cx
STD
block_copy:
movsb
LOOP block_copy
pop cx
pop di
pop si
popf
ret
endp

end start

