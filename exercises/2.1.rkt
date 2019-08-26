#lang sicp
; Exercise 2.1
; Define a better version of `make-rat` that handles both positive and negative
; arguments.
; `make-rat` should normalize the sign so that if the rational number is
; positive, both the numerator and denominator are positive, and if the rational
; number is negative, only the numerator is negative.

; A rational number is positive if numerator and denominator are either both 
; positive or both negative.
(define (make-rat n d)
  (cond 
    ((and (negative? n) (negative? d)) 
     (cons (abs n) (abs d)))
    ((and (positive? n) (positive? d)) 
     (cons n d))
    (else (cons (* -1 (abs n)) (abs d)))))

(define (negative? n) (< n 0))
(define (positive? n) (< 0 n))
