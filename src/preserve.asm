global _start

_start:
  call func             ; call function func
  mov eax, 1            ; set syscall to sys_exit
  mov ebx, 0            ; set error_code to 0
  int 0x80              ; syscall

func:
  push ebp              ; push ebp onto stack
  mov ebp, esp          ; move contents of esp to ebp
  sub esp, 2            ; allocate 2 bytes from stack
  mov [esp], byte 'H'   ; Add H to esp
  mov [esp+1], byte 'i' ; add i to esp
  mov eax, 4            ; set eax to sys_write
  mov ebx, 1            ; stdout
  mov ecx, esp          ; move bytes to write from esp to ecx
  mov edx, 2            ; amount of bytes to write
  int 0x80              ; syscall sys_write
  mov esp, ebp          ; move contents of ebp back to esp
  pop ebp               ; pop ebp from stack
  ret                   ; return to _start

