#lang sicp

; linear recursive
(define (exp1 b n)
  (if (= n 0)
    1
    (* b (exp1 b (- n 1)))))

; linear iterative
(define (exp2 b n)
  (define (iter product counter) 
    (if (= counter 0)
      product
      (iter (* product b) (- counter 1)))) 
  (iter 1 n))

; if n is even: b^n = (b^(n/2))^2
; if n is odd: b^n = b * b^(n-1)
(define (exp3 b n) 
  (cond ((= n 0) 1)
        ((even? n) (square (exp3 b (/ n 2))))
        (* b (exp3 b (- n 1)))))

(define (even? n) 
  (= (remainder n 2) 0))

(define (square n) (* n n))
