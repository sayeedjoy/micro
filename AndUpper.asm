.model small
.stack 100h
.code
main proc
    mov ah, 1
    int 21h           ; Read char into AL
    and al, 0DFh      ; Convert to uppercase
    mov dl, al
    mov ah, 2
    int 21h           ; Print char
    mov ah, 4ch
    int 21h
main endp
end main
