#lang sicp

(define (square-list-1 xs) 
  (if (null? xs)
    xs
    (cons (* (car xs) (car xs)) 
          (square-list-1 (cdr xs)))))

(define (square-list-2 xs) 
  (map (lambda (x) (* x x)) xs))
 
(define foo (square-list-1 (list 1 2 3 4)))
(define bar (square-list-2 (list 1 2 3 4)))
