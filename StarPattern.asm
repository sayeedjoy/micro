.model small
.stack 100h
.data
newline db 13,10,'$'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 15         ; Total stars to print
    mov bl, 1          ; Stars per row (increases each row)
    mov ch, 0          ; Counter for stars in current row

main_loop:
    mov ah, 2
    mov dl, '*'
    int 21h            ; Print a star

    inc ch             ; Increase star count for this row

    cmp ch, bl         ; Is this row finished?
    jne skip_newline   ; If not, continue

    lea dx, newline
    mov ah, 9
    int 21h            ; Print newline

    inc bl             ; Next row, more stars
    mov ch, 0          ; Reset row star count

skip_newline:
    loop main_loop     ; Repeat until CX = 0

    mov ah, 4ch
    int 21h            ; Exit
main endp
end main
