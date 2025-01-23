## МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС

### Звіт з лабораторної роботи 3
 "Функціональний і імперативний підходи до роботи зі списками"
 дисципліни "Вступ до функціонального програмування"

**Студент**: *Петраш Павло Степанович КВ-13*


**Рік**: *2025*

## Завдання:
Реалізуйте алгоритм сортування чисел у списку двома способами: функціонально і
імперативно.
1. Функціональний варіант реалізації має базуватись на використанні рекурсії і
конструюванні нових списків щоразу, коли необхідно виконати зміну вхідного
списку. Не допускається використання: псевдо-функцій, деструктивних операцій,
циклів, функцій вищого порядку або функцій для роботи зі списками/
послідовностями, що використовуються як функції вищого порядку. Також
реалізована функція не має бути функціоналом (тобто приймати на вхід функції в
якості аргументів).
2. Імперативний варіант реалізації має базуватись на використанні циклів і
деструктивних функцій (псевдофункцій). Не допускається використання функцій
вищого порядку або функцій для роботи зі списками/послідовностями, що
використовуються як функції вищого порядку. Тим не менш, оригінальний список
цей варіант реалізації також не має змінювати, тому перед виконанням
деструктивних змін варто застосувати функцію copy-list (в разі необхідності).
Також реалізована функція не має бути функціоналом (тобто приймати на вхід
функції в якості аргументів).
Алгоритм, який необхідно реалізувати, задається варіантом (п. 3.1.1). Зміст і шаблон
звіту наведені в п. 3.2.
Кожна реалізована функція має бути протестована для різних тестових наборів. Тести
мають бути оформленні у вигляді модульних тестів (наприклад, як наведено у п. 2.3).

### Варіант 14(6):
Варіант 6
Алгоритм сортування вставкою №1 (з лінійним пошуком зліва) за незменшенням

**Код програми:**
```
(defun insert (x sorted-list)
  (if (or (null sorted-list) (<= x (car sorted-list)))
      (cons x sorted-list)
      (cons (car sorted-list) (insert x (cdr sorted-list)))))

(defun insertion-sort-functional (list)
  (if (null list)
      nil
      (insert (car list) (insertion-sort-functional (cdr list)))))


(defun insertion-sort-imperative (list)
  (let ((sorted (list))) ; Початково порожній список
    (dolist (x (copy-list list) sorted)
      (let ((new-sorted (list)) ; Новий список для формування результату
            (inserted nil))    ; Прапорець для перевірки вставки
        (dolist (y sorted)
          (if (and (not inserted) (<= x y))
              (progn
                (setq new-sorted (append new-sorted (list x))) ; Вставка x перед y
                (setq inserted t)))
          (setq new-sorted (append new-sorted (list y)))) ; Додавання y
        (unless inserted
          (setq new-sorted (append new-sorted (list x)))) ; Вставка x в кінець
        (setq sorted new-sorted)))) ; Оновлення відсортованого списку
    sorted))




(defun test-insertion-sort ()
  (format t "Functional Sort Tests:~%")
  (format t "Test 1: ~A~%" (equal (insertion-sort-functional '(3 1 4 1 5 9)) '(1 1 3 4 5 9)))
  (format t "Test 2: ~A~%" (equal (insertion-sort-functional '(5 3 8 6 2 7)) '(2 3 5 6 7 8)))
  (format t "Test 3: ~A~%" (equal (insertion-sort-functional '(1 2 1 -3 -2)) '(-3 -2 1 1 2)))
  (format t "Test 4: ~A~%" (equal (insertion-sort-functional '(1 2 3 4 5 6)) '(1 2 3 4 5 6)))
  (format t "Test 5: ~A~%" (equal (insertion-sort-functional '(1)) '(1)))
  (format t "Test 6: ~A~%" (equal (insertion-sort-functional '()) '()))

  (format t "Imperative Sort Tests:~%")
  (format t "Test 1: ~A~%" (equal (insertion-sort-imperative '(3 1 4 1 5 9)) '(1 1 3 4 5 9)))
  (format t "Test 2: ~A~%" (equal (insertion-sort-imperative '(5 3 8 6 2 7)) '(2 3 5 6 7 8)))
  (format t "Test 3: ~A~%" (equal (insertion-sort-imperative '(1 2 1 -3 -2)) '(-3 -2 1 1 2)))
  (format t "Test 4: ~A~%" (equal (insertion-sort-imperative '(1 2 3 4 5 6)) '(1 2 3 4 5 6)))
  (format t "Test 5: ~A~%" (equal (insertion-sort-imperative '(1)) '(1)))
  (format t "Test 6: ~A~%" (equal (insertion-sort-imperative '()) '())))

(test-insertion-sort)


```
**Результат тестування:**
```
Output:

Functional Sort Tests:
Test 1: T
Test 2: T
Test 3: T
Test 4: T
Test 5: T
Test 6: T
Imperative Sort Tests:
Test 1: T
Test 2: T
Test 3: T
Test 4: T
Test 5: T
Test 6: T
```
