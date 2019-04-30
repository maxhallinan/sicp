#lang sicp

(define (expt base power)
  (define (iter a b p)
    (cond ((= p 0) a) 
          ((even? p) (iter a (square b) (/ p 2))) 
          (else (iter (* a b) b (- p 1)))))
  (iter 1 base power))

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))
