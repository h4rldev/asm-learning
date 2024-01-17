global _start

_start:
  call func ; call function func
  mov eax, 1 ; set syscall to sys_exit
  int 0x80 ; syscall

func:
  mov ebx, 42 ; set errorcode
  ret
  ; pop eax ; pop from stack into eax
  ; jmp eax ; push next instruction by jumping to eax
  
