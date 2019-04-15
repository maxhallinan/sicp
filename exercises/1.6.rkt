#lang sicp

; The difference between if and new-if is the difference of the way special 
; forms and procedures are evaluated.
; Normal procedures are evaluated using applicative-order evaluation.
; This means that the arguments to a function are evaluated first, and then the 
; function body is evaluated.
; Special forms don't always follow applicative-order evaluation.
; In the case of `if`, only one of the two clauses is evaluated.
; If the predicate is true, then the left-hand side is evaluated.
; If the predicate is false, then the right-hand side is evaluated.
; The same principle applies to `cond`.
; Wrapping `cond` in `new-if` means that the evaluation of the arguments becomes 
; applicative-order, instead of the conditional evaluation used by `cond`.
; So the right-hand side is evaluated even if the predicate is `true`.
; In this case, the right hand side is a recursive function call and evaluation 
; gets stuck in an infinite loop.
; `sqrt-iter` depends on the conditional to stop the recursion.

(define (sqrt x) 
  (sqrt-iter 1.0 x))

; works
(define (sqrt-iter guess x) 
  (if (good-enough? guess x) 
    guess 
    (sqrt-iter 
      (improve guess x) 
      x)))

; works
; (define (sqrt-iter guess x) 
;   (cond 
;     ((good-enough? guess x) guess)
;     (else (sqrt-iter (improve guess x) 
;                     x))))

; infinite loop
; (define (sqrt-iter guess x) 
;   (new-if (good-enough? guess x) 
;     guess 
;     (sqrt-iter 
;       (improve guess x) 
;       x)))

(define (good-enough? guess x) 
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x) 
  (average guess (/ x guess)))

(define (average x y) 
  (/ (+ x y) 2))

(define (square x) (* x x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
