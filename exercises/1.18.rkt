#lang sicp

(define (mult x y) 
  (define (iter a b n) 
    (cond ((= n 0) a) 
          ((even? n) (iter a (double b) (halve n))) 
          (else (iter (+ a b) b (- n 1)))))
  (iter 0 x y))

(define (even? n) 
  (= 0 (remainder n 2)))

(define (double n) 
  (+ n n))

(define (halve n) 
  (/ n 2))
