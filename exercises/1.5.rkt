#lang sicp

; Applicative-order evaluation: evaluation of `(test 0 (p))` never finishes. 
; The interpreter attempts to evaluate `(p)` and gets stuck in an infinite loop.
;
; Normal-order evaluation: `(test 0 (p))` evaluates to 0.
; `(p)` is only evaluated if the first argument is greater than 0.

(define (p) (p))

(define (test x y) (if (= x 0) 0 y))

(test 0 (p))
