section .data
  buffer dw "BBBB"
  chr db '*'
  count db 4
section .bss

section .text
  global main

main:
  push count
  push chr
  push buffer
  call memset
  mov edx , eax
  mov eax , 1
  int 80h

memset:
  push ebp
  mov ebp , esp
  xor ax , ax
  mov edi , [ebp + 8] ; dest
  mov ax , [ebp + 0xC] ; char
  mov ecx , [ebp + 0x10] ; counter
  rep stosb
  ;mov eax , [edi]
  mov esp , ebp
  pop ebp
  ret
