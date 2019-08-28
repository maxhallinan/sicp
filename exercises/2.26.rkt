#lang sicp
; What result is printed when evaluating each expression?
(define x (list 1 2 3))
(define y (list 4 5 6))
(define foo (append x y))
; (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 Nil))))))
(define bar (cons x y))
; (Cons (Cons 1 (Cons 2 (Cons 3 Nil))) (Cons 4 (Cons 5 (Cons 6 Nil))))
(define baz (list x y))
; (Cons (Cons (Cons 1 (Cons 2 (Cons 3))) (Cons 4 (Cons 5 (Cons 6)))) Nil)
