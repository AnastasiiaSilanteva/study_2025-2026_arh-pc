%include 'in_out.asm'
SECTION .data
    div: DB 'Выражение для вычисления: y = (12*x + 3) * 5', 0
    msg: DB 'Введите x: ', 0
    rem: DB 'Результат вычисления равен: ', 0
    
SECTION .bss
    x resb 10           ; буфер для ввода x
    result resd 1       ; место для хранения результата
 
SECTION .text
GLOBAL _start
_start:
    ; Выводим выражение для вычисления
    mov eax, div
    call sprintLF
    
    ; Выводим запрос на ввод x
    mov eax, msg
    call sprint
    
    ; Читаем значение x
    mov ecx, x
    mov edx, 10
    call sread
    
    ; Преобразуем строку в число
    mov eax, x
    call atoi
    mov [x], eax
    
    ; Вычисляем 12*x
    mov eax, [x]        ; загружаем x в eax
    mov ebx, 12         ; ebx = 12
    imul ebx            ; eax = 12 * x
    
    ; Добавляем 3: 12*x + 3
    add eax, 3          ; eax = 12*x + 3
    
    ; Умножаем на 5: (12*x + 3) * 5
    mov ebx, 5          ; ebx = 5
    imul ebx            ; eax = (12*x + 3) * 5
    
    ; Сохраняем результат
    mov [result], eax
    
    ; Выводим сообщение о результате
    mov eax, rem
    call sprint
    
    ; Выводим сам результат
    mov eax, [result]
    call iprintLF
    
    ; Завершаем программу
    call quit

