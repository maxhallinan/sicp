#lang sicp

; Show that we can represent pairs of nonnegative integers using only numbers 
; and arithmetic operations if we represent the pair `a` and `b` as the integer
; that is the product 2^a * 3^b.
; Give the corresponding definitions of the procedures `cons`, `car`, and `cdr`.

(define (cons_ x y) 
  (* (expt 2 x) 
     (expt 3 y)))

(define (car_ n) ())

(define (cdr_ n) ())
