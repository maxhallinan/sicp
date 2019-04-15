#lang sicp

(define (sqrt x) 
  (sqrt-iter 0.0 1.0 x))

(define (sqrt-iter last-guess guess x) 
  (if (good-enough? last-guess guess) 
    guess 
    (sqrt-iter 
      guess
      (improve guess x) 
      x)))

; "...watch how guess changes from one iteration to the next and stop when the 
; change is a very small fraction of the guess."
(define (good-enough? last-guess guess) 
  (< (abs (- guess last-guess)) 0.001))

(define (improve guess x) 
  (average guess (/ x guess)))

(define (average x y) 
  (/ (+ x y) 2))

(define (square x) (* x x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(sqrt 0.0001)
; 0.010000714038711746
; with the old definition of `good-enough?`, this evaluates to 0.03230844833048122
(sqrt 10000000000000)
; 3162277.6601683795
; with the old definition of `good-enough?`, this gets stuck in an infinite loop
