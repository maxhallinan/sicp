#lang sicp

; Use the (lambda (x y . rest) <body>) notation to write a procedure same-parity
; that takes one or more integers and returns a list of all the arguments that
; have the same even-odd parity as the first argument.
; In other words, if the first argument is even, return all the even arguments
; If the first argument is odd, return all the odd arguments

(define (same-parity x . xs)
  (cond ((null? xs) xs) 
        ((even? x) (cons x (filter even? xs))) 
        (else (cons x (filter odd? xs)))))
(define (filter pred xs) 
  (cond ((null? xs) xs) 
        ((pred (car xs)) (cons (car xs) (filter pred (cdr xs)))) 
        (else (filter pred (cdr xs)))))

(define foo (same-parity 1 2 3 4 5 6 7))
; (1 3 5 7)
(define bar (same-parity 2 3 4 5 6 7))
; (2 4 6)
