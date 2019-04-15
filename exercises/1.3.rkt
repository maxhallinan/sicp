#lang sicp

(define (square x)
  (* x x))

(define (square-sum x y)
  (+ (square x) (square y)))

(define (foo x y z)
  (cond
    ((and (>= x y) (> y z)) 
     (square-sum x y))
    ((and (>= y x) (>= z x)) 
     (square-sum y z))
    ((and (>= x y) (>= z y)) 
     (square-sum x z))))

(eq? (foo 1 2 3) 13)
(eq? (foo 3 2 1) 13)
(eq? (foo 3 1 2) 13)
(eq? (foo 1 1 1) 2)
(eq? (foo 2 1 1) 5)
(eq? (foo 1 2 1) 5)
(eq? (foo 1 1 2) 5)
