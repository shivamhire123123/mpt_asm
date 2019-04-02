.8086
.model small
.stack 100
.data
arr db "bcdefgahijklmnop", 0ah, 0dh, "$"
smallest db "smallest is :- $"
largest db "largest is :- $"
new_line db 0ah, 0dh, "$"
.code
start:
mov ax, @data
mov ds, ax

mov dx, offset arr
mov ah, 09h
int 21h

mov si, offset arr
mov cx, 10h
call smallest_num

mov dx, offset smallest
mov ah, 09h
int 21h
mov dl, al
mov ah, 02h
int 21h

mov si, offset arr
mov cx, 10h
call largest_num

mov dx, offset new_line
mov ah, 09h
int 21h

mov dx, offset largest
mov ah, 09h
int 21h
mov dl, al
mov ah, 02h
int 21h

mov ah, 4ch
int 21h

;starting address of block in si, size of block in cx and return smallest number in al
smallest_num proc
push si
pushf
mov al, [si]
find_smallest:
cmp al, [si]
jb smallest_skip_swap
mov al, [si]
smallest_skip_swap:
inc si
loop find_smallest
popf
pop si
ret
endp

;starting address of block in si, size of block in cx and return largest number in al
largest_num proc
push si
pushf
mov al, [si]
find_largest:
cmp al, [si]
ja largest_skip_swap
mov al, [si]
largest_skip_swap:
inc si
loop find_largest
popf
pop si
ret
endp
end start
