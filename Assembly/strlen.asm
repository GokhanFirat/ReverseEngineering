section .data
  string db "Hello, World!"

section .text
  global main

main:
  push string
  call strlen
  mov edx , eax
  mov eax , 1
  int 80h

strlen:
  nop
  push ebp
  mov ebp , esp
  xor al , al        ; set eax to null byte
  mov edi, [ebp + 8]    ; get first parameter
  mov edx, edi         ; copy address to start of string
  repne scasb          ; search null byte
  sub edi, edx   ; substract start address from end address
  mov eax , edi
  mov esp, ebp
  pop ebp
  ret
