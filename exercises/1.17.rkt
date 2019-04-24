#lang sicp

(define (mult x y) 
  (cond ((= y 0) 0) 
        ((even? y) (double (mult x (halve y)))) 
        (else (+ x (mult x (- y 1))))))

(define (even? n) 
  (= 0 (remainder n 2)))

(define (double n) 
  (+ n n))

(define (halve n)
  (/ n 2))
