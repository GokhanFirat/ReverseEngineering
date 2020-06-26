section .data
  char DB 'x '
  num DW 123
  strn DW "The Variable"
  len equ $ - strn

section .text
  global _start

_start:

  mov eax , 4
  mov ebx , 1
  mov ecx , char
  mov edx , 1
  int 80h

  mov eax , 4
  mov ebx , 1
  mov ecx , num
  mov edx , 3
  int 80h

  mov eax , 4
  mov ebx , 1
  mov ecx , strn
  mov edx , len
  int 80h


  mov eax , 1
  int 80h
