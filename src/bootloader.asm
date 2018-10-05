SYS_EXIT  equ 1
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

%macro write_string 2
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

section .text
    global _start
    
_start:
    MOV [STRING], dword 'Robo'
    write_string STRING, LENGTH
    write_string STARS, STARS_LENGTH
    call exit

exit:
    mov eax, SYS_EXIT
    int 0x80
    ret

section .data
    STRING db 'Hello world!', 0xa
    LENGTH equ $ - STRING

    STARS times 10 db '*'
    STARS_LENGTH equ $ - STARS
