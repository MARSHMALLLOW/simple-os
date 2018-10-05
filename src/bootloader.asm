SYS_EXIT  equ 1
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

%macro writeLine 2
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

section .text
    global _start
    
_start:
    writeLine STRING LENGTH
    call exit

exit:
    mov eax, SYS_EXIT
    int 0x80
    ret

section .data
    STRING db 'Hello, world!'
    LENGTH equ $ - STRING
