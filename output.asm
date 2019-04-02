.8086
.model small
.stack 100
.data
.code
start:
mov ax, @data
mov ds, ax

mov ah, 4ch
int 21h

;This function takes space separated numbers as inputs from keyboard
;Starting address of block where number must be stored,
;and number of numbers must be pushed onto the stack in that order. All
;data pushed on stack is assumed to be 16 bit
;data is assumed to fit in 16 bit
input_num proc
push bp
mov bp, sp
push ax
push bx
push cx
push si
mov ax, 00h
mov cx, [bp + 4]
mov si, [bp + 8]

get_num:
mov ah, 01h
int 21h
cmp al, " "
je
cmp al, 0dh
je




end start
