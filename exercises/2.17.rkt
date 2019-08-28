#lang sicp

; Define a procedure last-pair that returns the list that contains only the last
; element of a given (nonempty) list:
(define (last-pair xs) 
  (define (iter y ys) 
    (if (null? ys)
      (list y)
      (iter (car ys) (cdr ys))))
  (if (null? xs) 
    xs
    (iter (car xs) (cdr xs))))

(define foo (last-pair (list 23 72 149 34)))
(define bar (last-pair (list 23 72)))
