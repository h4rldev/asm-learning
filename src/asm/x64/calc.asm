;---------------------------------------------------------
SYS_READ  equ 0
SYS_WRITE equ 1 
SYS_EXIT  equ 60
STDIN     equ 0
STDOUT    equ 1 
;---------------------------------------------------------

section .bss
;---------------------------------------------------------
  no1input_len  equ 24
  no1input      resb no1input_len
;---------------------------------------------------------
  no2input_len  equ 24
  no2input      resb no2input_len
;---------------------------------------------------------
  opinput_len   equ 24
  opinput       resb opinput_len
;---------------------------------------------------------


section .data
;---------------------------------------------------------
  less_than db "<"
  greater_than db ">"
  multi db "*"
  division db "/"
  negate db "neg"
  addto db "+"
  subtract db "-"
;---------------------------------------------------------
  no1 db      "Enter first number: "
  no1_len     equ $ - no1
;---------------------------------------------------------
  no2 db      "Enter second number: "
  no2_len     equ $ - no2
;---------------------------------------------------------
  calc_op db  "Enter operator chosen: "
  calc_op_len equ $ - calc_op
;---------------------------------------------------------
  res db      "Result: "
  res_len     equ $ - res
;---------------------------------------------------------
  noop db     "No valid operator found.. Exiting..", 0x0a
  noop_len    equ $ - noop
;---------------------------------------------------------
  testfn db     "Test!", 0x0a
  testfn_len    equ $ - testfn
;---------------------------------------------------------


section .text
;---------------------------------------------------------
  global _start
;---------------------------------------------------------

_start:
;---------------------------------------------------------
  mov rsi, no1
  mov rdx, no1_len
  call write
;---------------------------------------------------------
  mov rcx, no1input_len
  lea rdi, [no1input]
  call read
;---------------------------------------------------------
  mov rsi, no2
  mov rdx, no2_len
  call write
;---------------------------------------------------------
  mov rcx, no2input_len
  lea rdi, [no2input]
  call read
  dec rcx
;---------------------------------------------------------
  mov rsi, calc_op
  mov rdx, calc_op_len
  call write
;---------------------------------------------------------
  mov rcx, opinput_len
  lea rdi, [opinput]
  call read
  dec rcx
;---------------------------------------------------------
  lea rsi, [opinput]
  mov rdx, opinput_len
  call write

  lea rdi, [less_than]
  mov rcx, opinput_len
  rep cmpsb
  je less
  
  lea rdi, [greater_than]
  rep cmpsb
  je greater

  lea rdi, [multi]
  rep cmpsb
  je multiply

  mov rdi, division
  cld
  repe cmpsb
  je divide

  mov rdi, negate
  cld
  repe cmpsb
  je negation

  mov rdi, addto
  cld
  repe cmpsb
  je addition

  mov rdi, subtract
  cld
  repe cmpsb
  je subtraction

  mov rsi, noop
  mov rdx, noop_len
  call write
  jmp issue

issue:
  mov rax, SYS_EXIT
  mov rdi, 1
  syscall

exit:
  mov rax, SYS_EXIT
  xor rdi, rdi
  syscall

write:
  mov rax, SYS_WRITE
  mov rdi, STDOUT
  syscall
  ret

read:
  mov rax, SYS_READ  ; System call number for 'read' is 0
  mov rdi, STDIN     ; File descriptor 0 is stdin
  mov rsi, rdi       ; rsi now holds the address of the buffer
  mov rdx, rcx       ; Size of the buffer
  syscall            ; Execute 'read(0, buffer, size)'
  ret

multiply:
  mov rsi, testfn
  mov rdx, testfn_len
  call write
  ret

divide:
  ret

negation:
  ret

less:
  ret

greater:
  ret

addition:
  ret

subtraction:
  ret

