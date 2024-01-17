global add42        ; expose add42

add42:
  push ebp          ; Add ebp to stack
  mov ebp, esp      ; Move esp to ebp 
  mov eax, [ebp+8]  ; Move argument to eax
  add eax, 42       ; add 42 to argument
  mov esp, ebp      ; restore esp
  pop ebp           ; pop ebp from stack
  ret               ; return
