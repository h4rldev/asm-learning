global _start

_start:
  push 21           ; push 21 onto stack aka address 28
  call times2       ; call times2 function with the argument of 21
  mov ebx, eax      ; move contents of eax (returned from times2) onto ebx ie errorcode
  mov eax, 1        ; set syscall to sys_exit
  int 0x80          ; syscall

times2:
  push ebp          ; push ebp onto the stack ie address 20
  mov ebp, esp      ; add pointer esp onto ebp
  mov eax, [ebp+8]  ; move argument (ebp address + 8) to eax
  add eax, eax      ; add contents of eax to itself making it double the returned value
  mov esp, ebp      ; return esp to itself
  pop ebp           ; remove ebp from stack
  ret               ; return
