#lang sicp

#|
Miller-Rabin test

If n is a prime number and a is any positive integer less than n, then a raised
to the (n - 1) power is congruent to 1 modulo n:

a^(n - 1) % n = 1 % n

Pick a random number a < n
Raise a to the (n - 1) power

In expmod, during the squaring step, check to see for a "nontrivial square root 
of 1 modulo n":
sqrt(1 % n) != 1
sqrt(1 % n) != n - 1
If these conditions hold, then 1 is not prime.

It is also possible to prove that if n is an odd number that is not prime, then,
for at least half the numbers a < n, computing a^(n - 1) reveals a nontrivial 
square root of (1 % n).
|#
(define (prime? n) 
  (define (run-test n times) 
    (cond ((= times 0) true) 
          ((miller-rabin-test n) (run-test n (- times 1))) 
          (else false)))
  (run-test n 3))

(define (miller-rabin-test n) 
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

#|
Compute the exponential of a number modulo another number: a^b % c.

Whenever we perform the squaring step in expmod, we check to see if we have 
discovered a "nontrivial square root of 1 modulo n", that is a number not equal
to 1 or n - 1, whose square is equal to 1 modulo n.
|#
(define (expmod base exp m)
  (cond ((= exp 0) 1) 
        ((even? exp) 
         (if (non-trivial? base m) 
           0
         (remainder (square (expmod base (/ exp 2) m)) m)))
        (else 
          (remainder (* base (expmod base (- exp 1) m)) m))))

(define (non-trivial? a n) 
  (cond ((= a 1) false)
        ((= a -1) false)
        (else (= (modulo (square a) n)
                 (modulo 1 n)))))

(define (square n) 
  (* n n))

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
; Carmichael numbers.
(equal? #f (prime? 561))
(equal? #f (prime? 1105))
(equal? #f (prime? 1729))
(equal? #f (prime? 2465))
(equal? #f (prime? 2821))
(equal? #f (prime? 6601))
