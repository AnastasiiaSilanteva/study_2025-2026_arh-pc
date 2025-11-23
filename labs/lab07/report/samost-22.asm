%include 'in_out.asm'

SECTION .data
    msg_x: DB 'Введите значение переменной x: ', 0
    msg_a: DB 'Введите значение переменной a: ', 0
    res: DB 'Результат: ', 0

SECTION .bss
    x: RESB 80
    a: RESB 80

SECTION .text
GLOBAL _start

_start:
    ; Ввод значения переменной x
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi
    mov edi, eax       ; edi = x

    ; Ввод значения переменной a
    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 80
    call sread
    mov eax, a
    call atoi
    mov esi, eax       ; esi = a

    ; Сравниваем x и a
    cmp edi, esi
    jl less_than_a     ; если x < a, перейти к less_than_a

    ; Если x >= a, вычисляем x - 1
    dec edi            ; edi = x - 1
    jmp print_result

less_than_a:
    ; Если x < a, вычисляем a - 1
    dec esi            ; esi = a - 1
    mov edi, esi       ; сохраняем результат в edi

print_result:
    ; Выводим результат
    mov eax, res
    call sprint
    mov eax, edi       ; загружаем результат для вывода
    call iprintLF
    
    ; Завершение программы
    call quit

