SYS_EXIT  equ 1
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

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
