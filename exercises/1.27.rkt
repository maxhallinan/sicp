#lang sicp

(define (prime? n) 
  (define (iter a) 
    (cond ((= a n) true)
          ((fermat-theorem n a) (iter (+ a 1)))
          (else false)))
  (iter 1))

#|
If n is a prime number and a is any integer less than n, then a raised to the
nth power is congruent to a modulo n.

If n is not prime, then, in general, most of the numbers a < n will not satisfy
the above relation.
|#
(define (fermat-theorem n a) 
  (congruent? (expt a n) 
              (modulo a n)
              n))

#|
Two numbers are said to be congruent modulo n if they both have the same 
remainder when divided by n.
|#
(define (congruent? x y z) 
  (= (modulo x z) 
     (modulo y z)))

; Non-prime
(equal? #f (prime? 4))
(equal? #f (prime? 6))
(equal? #f (prime? 8))
(equal? #f (prime? 9))
(equal? #f (prime? 10))
; Prime
(equal? #t (prime? 2))
(equal? #t (prime? 3))
(equal? #t (prime? 5))
(equal? #t (prime? 7))
#| 
Carmichael numbers are not prime but pass the Fermat test.
First six Carmichael numbers.
|#
(equal? #t (prime? 561))
(equal? #t (prime? 1105))
(equal? #t (prime? 1729))
(equal? #t (prime? 2465))
(equal? #t (prime? 2821))
(equal? #t (prime? 6601))
