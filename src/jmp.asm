global _start   ; init

_start:
  mov ecx, 99   ; set exc to 99
  mov ebx, 42   ; exit 42
  mov eax, 1    ; sys_exit syscall
  cmp ecx, 100  ; compare exc to 100
  jl skip,      ; jump to skip if last instruction is less than 100
  mov ebx, 13   ; exit 13

skip:
  int 0x80      ; interrupt
