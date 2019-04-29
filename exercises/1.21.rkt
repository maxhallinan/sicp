#lang sicp

(define (smallest-divisor n) 
  (define (iter test-divisor) 
    (cond ((> (square test-divisor) n) n) 
          ((divides? test-divisor n) test-divisor) 
          (else (iter (+ test-divisor 1)))))
  (iter 2))

(define (divides? divisor n) 
  (= (remainder n divisor) 0))

(define (square n) 
  (* n n))

(= 199 (smallest-divisor 199))
(= 1999 (smallest-divisor 1999))
(= 7 (smallest-divisor 19999))
