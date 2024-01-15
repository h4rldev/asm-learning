global _start

_start:
  sub esp, 4
  mov [esp], byte 'H'     ; allocate H to esp byte 0
  mov [esp+1], byte 'e'   ; allocate e to esp byte 1
  mov [esp+2], byte 'y'   ; allocate y to esp byte 2
  mov [esp+3], byte '!'   ; allocate ! to esp byte 3 (last one)
  mov eax, 4              ; sys_write syscall
  mov ebx, 1              ; stdout descriptor
  mov ecx, esp            ; store contents of the address esp to ecx
  mov edx, 4              ; number of bytes to write to stdout
  int 0x80
  mov eax, 1              ; sys_exit syscall
  mov ebx, 0              ; set errorcode to 0
  int 0x80
