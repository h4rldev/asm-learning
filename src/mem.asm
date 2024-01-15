global _start

section .data
  ; db is 1 byte
  addr db "yellow"        ; store yellow as string to variable addr

section .text
  _start:
    mov [addr], byte 'H'    ; move byte of H into yellow
    mov [addr+5], byte '!'  ; move byte of ! into yellow at the index of 5
    mov eax, 4              ; set syscall to sys_write
    mov ebx, 1              ; write to stdout
    mov ecx, addr           ; bytes to write
    mov edx, 6              ; amount of bytes to write
    int 0x80                ; run syscall
    mov eax, 1              ; set syscall to sys_exit
    mov ebx, 0              ; set errorcode to 0
    int 0x80                ; run syscall
