#lang sicp
; In case representing pairs as procedures wasn't mind-boggling enough, 
; consider that, in a language that can manipulate procedures, we can get by 
; without numbers (at least insofar as nonnegative integers are concerned) by
; implementing 0 and the operation of adding 1 as:

; Church numerals
; zero: \f. \x. x
; one: \f. \x. f x
; two: \f. \x. f f x
; three: \f. \x. f f f x

(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))
(define (add-2 n) (lambda (f) (lambda (x) (f (f ((n f) x))))))
(define (add-3 n) (lambda (f) (lambda (x) (f (f (f ((n f) x)))))))

; A church numeral is a function that takes a function `f` and a returns a 
; function that takes an argument `x`, and applies `f` to `x` n number of times.
; The number of times n is applied to x is the number encoded by the church 
; numeral.
; So the Church encoding of 1 applies `f` to `x` one time
; The Church encoding of 2 applies `f` to `x` twice
; 
; These add functions take
; `n`, which is a church numeral
; they return a church numeral ("a function that takes a function `f`...")
; they apply `f` to the first church numeral
; and apply x to the result of that
; and then apply f again once, essentially adding one.
(define (add a b) 
  (lambda (f) 
    (lambda (x) ((a x) ((b x) x)))))

(define zero (lambda (f) (lambda (x) x)))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

; (add one zero)
(lambda (f) (lambda (x) ((one zero) x))
(lambda (f) (lambda (x) ((lambda (f) (lambda (x) (f (zero x)) zero) x)))
(lambda (f) (lambda (x) ((lambda (f) (lambda (x) (f ((lambda (f) (lambda (x) x) x)) zero) x)))
(lambda (f) (lambda (x) ((lambda (f) (lambda (x) (f ((lambda (f) (lambda (x) x) x)) zero) x)))
