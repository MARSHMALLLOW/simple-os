SYS_EXIT  EQU 1
SYS_WRITE EQU 4
STDIN     EQU 0
STDOUT    EQU 1

section .text
    global _start

_start:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, string
    mov edx, length
    int 0x80

    mov eax, SYS_EXIT
    int 0x80

section .data
    string db 'Hello, world!', 0xa
    length equ $ - string
