global _start

section .data
  msg db "Hello, world!", 0x0a ; Set msg variable to "Hello, world!\n"
  len equ $ - msg              ; Set msg length

section .text
  _start:
    mov eax, 4                 ; sys_write syscall
    mov ebx, 1                 ; stdout
    mov ecx, msg               ; bytes to write to stdout
    mov edx, len               ; amount to write to stdout
    int 0x80                   ; run
    mov eax, 1                 ; sys_exit syscall
    mov ebx, 0                 ; set exit status to 0
    int 0x80                   ; run
