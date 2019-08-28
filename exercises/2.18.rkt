#lang sicp

; Define a procedure reverse that takes a list as argument and returns a list of
; the same elements in reverse order.

(define (reverse xs) 
  (if (null? xs)
    xs
    (append (reverse (cdr xs)) (list (car xs)))))

(define foo (reverse (list 1 4 9 16 25)))
