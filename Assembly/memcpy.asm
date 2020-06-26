section .data
  src db "aabbcc"
  dst db ''
  count equ $ - src

;section .bss
;  resb dst 2

section .text
  global main

main:
  nop
  push count
  push src
  push dst
  call memcpy
  mov edx, eax
  mov eax, 1
  int 80h

memcpy:
  push ebp
  mov ebp, esp
  mov edi, [ebp + 8] ; destination buffer
  mov esi, [ebp + 0xC] ; source buffer
  mov ecx, [ebp + 0x10] ; Number of characters to copy
_loop:
  mov al, [esi]
  mov [edi], al
  inc esi
  inc edi
  dec ecx
  jnz _loop
  mov esp, ebp
  pop ebp
  ret
