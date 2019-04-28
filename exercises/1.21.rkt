#lang sicp

(define (smallest-divisor n) 
  (define (iter x test-divisor) 
    (cond ((> (square test-divisor) x) x) 
          ((divides? test-divisor x) test-divisor) 
          (else (iter n (+ test-divisor 1)))))
  (iter n 2))

(define (divides? divisor n) 
  (= (remainder n divisor) 0))

(define (square n) 
  (* n n))

(= 199 (smallest-divisor 199))
(= 1999 (smallest-divisor 1999))
(= 7 (smallest-divisor 19999))
