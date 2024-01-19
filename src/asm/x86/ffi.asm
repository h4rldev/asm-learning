global main                           ; export label to C
extern printf                         ; get function printf from C

section .data
  msg db "Testing %i...", 0x0a, 0x00  ; store format string with integer format, with \n and null terminator  

section .text
  main:
    push ebp                          ; push ebp onto stack
    mov ebp, esp                      ; move esp into ebp
    push 123                          ; push second argument
    push msg                          ; push message
    call printf                       ; call printf
    mov eax, 0                        ; set return value for main
    mov esp, ebp                      ; move back contents of ebp into esp
    pop ebp                           ; pop ebp from stack
    ret                               ; return
