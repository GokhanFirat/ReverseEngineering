section .data
  userMsg db 'Please enter a number: ' , 0xa
  lenUser equ $ - userMsg
  dispMsg db 'You have entered: '
  lenDisp equ $ - dispMsg

section .bss
  num resb 5

section .text
  global _start

_start:

  mov eax , 4
  mov ebx , 1
  mov ecx , userMsg
  mov edx , lenUser
  int 80h

  mov eax , 3
  mov ebx , 0
  mov ecx , num
  mov edx , 5
  int 0x80

  int 0x80
  mov eax , 4
  mov ebx , 1
  mov ecx , dispMsg
  mov edx , lenDisp
  int 0x80

  mov eax , 4
  mov ebx , 1
  mov ecx , num
  ;mov edx , 5
  int 0x80

  mov eax , 1
  int 0x80
