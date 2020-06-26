section .data
  msg db "Displaying 9 stars", 0xa
  star TIMES 9 db '*'
  msglen equ $ - msg

section .text
  global _start

_start:

  mov ecx , msg
  mov edx , msglen
  mov ebx , 1
  mov eax , 4
  int 0x80

  mov ecx , 9
  mov edx, star
  mov ebx , 1
  mov eax , 4
  int 0x80

  mov eax , 1
  int 0x80
