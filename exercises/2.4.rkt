#lang sicp

; `cons_` returns a function.
; The returned function expects a function argument.
; The returned function calls the function argument with the two items in the 
; pair.
; It's up to the function argument to do whatever with those two items.
; In the case of `car_`, it returns the first item.
; And in the case of `cdr_`, it returns the second item.
; Therefore, you `cons_` constructs a valid pair.
(define (cons_ x y)
  (lambda (m) (m x y)))

(define (car_ z) 
  (z (lambda (p q) p)))

(define (cdr_ z) 
  (z (lambda (p q) q)))

; (car_ (cons_ 'x 'y))
; (car_ (lambda (m) (m 'x 'y))) 
; ((lambda (m) (m 'x 'y)) (lambda (p q) p)) 
; ((lambda (p q) p) 'x 'y) 
; 'y

; (cdr_ (cons_ 'x 'y))
; (cdr_ (lambda (m) (m 'x 'y)))
; ((lambda (m) (m 'x 'y)) (lambda (p q) q))
; ((lambda (p q) q) 'x 'y)
; 'y
