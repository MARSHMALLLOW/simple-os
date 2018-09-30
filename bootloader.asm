section .text
    global _start

_start:                                      ;tell linker entry point
    mov eax, 4                               ;system call number (sys_write)
    mov ebx, 1                               ;file descriptor (stdout)
    mov ecx, string                          ;message to write
    mov edx, length                          ;message length
    int 0x80                                ;call kernel

    mov eax, 1                               ;system call number (sys_exit)
    int 0x80                                ;call kernel

section .data
    string db 'Hello, world!', 0xa                 ;our dear string
    length equ $ - string                             ;length of our dear string
