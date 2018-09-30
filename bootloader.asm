section .text
    global _start                              ;must be declared for linker (ld)

_start:                                      ;tell linker entry point
    mov edx, length                          ;message length
    mov ecx, string                          ;message to write
    mov ebx, 1                               ;file descriptor (stdout)
    mov eax, 4                               ;system call number (sys_write)
    int 0x80                                ;call kernel

    mov eax, 1                               ;system call number (sys_exit)
    int 0x80                                ;call kernel

section     .data
    string db  'Hello, world!',0xa                 ;our dear string
    length qu $ - msg                             ;length of our dear string
