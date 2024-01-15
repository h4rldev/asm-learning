global _start     ; init 

section .text
  _start:
    mov ebx, 1    ; exit status to 1, never use ebx for anything but error codes
    mov ecx, 4    ; number of iteration

  label:
    add ebx, ebx  ; double exit status
    dec ecx       ; decrement iteration with 1
    cmp ecx, 0    ; compare iteration with 0
    jg label      ; jump to label if greater than 0
    mov eax, 1    ; sys_exit syscall
    int 0x80      ; interrupt
