#lang sicp

; Give combinations of car and cdr that will pick 7 from each list.

(define foo (car (cdr (car (cdr (cdr '(1 3 (5 7) 9)))))))
(define bar (car (car (list (list 7)))))
(define baz (car (cdr (cdr (cdr (cdr (cdr (cdr '(1 2 3 4 5 6 7)))))))))
