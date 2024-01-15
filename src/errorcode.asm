global _start ; set _start symbol

_start:
  mov eax, 1  ; set syscall
  mov ebx, 42 ; set errorcode
  int 0x80    ; interrupt 80
