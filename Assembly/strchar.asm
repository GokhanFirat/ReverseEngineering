section .data
  string db "The quick brown dog jumps over the lazy fox" , 0xA
  len equ $ - string
  chr db 'q'
section .bss
  indx resb 2

section .text
  global main

main:
  push chr
  push string
  call strchar
  mov eax , 1
  int 80h

strchar:
  push ebp
  mov ebp , esp
  xor edi , edi
  xor al , al
  mov edi , [ebp + 8] ;buffer
  mov bl , [ebp + 12] ; char
iterate:
  mov cl , [edi]
  cmp bl , cl
  jz return ; if matched
  scasb
  jnz iterate
  mov edi , 0 ; return null if char did not match

return:
  mov eax , edi
  mov esp , ebp
  pop ebp
  ret
