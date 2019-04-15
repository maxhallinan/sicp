#lang sicp

(define (square x) (* x x))

(define (next-guess x guess) 
  (/ (+ guess (/ x guess)) 2))

(define (accurate? x guess) 
  ; (< (abs (- (square guess) x)) 0.001))
  ; why 
  (< (- x (square guess)) 0.001))

(define (approx x guess) 
  (if (accurate? x guess) 
    guess 
    (approx x (next-guess x guess))))

(define (square-root x) 
  (approx x 1.0))

(square-root 4)
