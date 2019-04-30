#lang sicp

#|
1000000000
1000000007 *** 1253
1000000009 *** 355
1000000021 *** 354
Total: 1962
1.19928644241 times faster than version 1

10000000000
10000000019 *** 1155
10000000033 *** 1974
10000000061 *** 1125
Total: 4254
1.71767748002 times faster than version 1

100000000000
100000000003 *** 4439
100000000019 *** 3913
100000000057 *** 4780
Total: 13132
2.02558635394 times faster than version 1

1000000000000
1000000000039 *** 14324
1000000000061 *** 14080
1000000000063 *** 12679
Total: 41083
1.94367499939 times faster than version 1

(4254 / 3) / (1962 / 3) = 2.16819571865
(13132 / 3) / (4254 / 3) = 3.08697696286
(41083 / 3) / (13132 / 3) = 3.12846481876

(2.17 + 3.1 + 3.13) / 3 = 2.8
Version 2 is roughly 1.16 times than version 1
|#

(define (smallest-divisor n)
  (define (next n) 
    (if (= n 2) 3 (+ n 2)))
  (define (iter test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (iter (next test-divisor)))))
  (iter 2))

(define (divides? divisor n) 
  (= 0 (remainder n divisor)))

(define (square x)
  (* x x))

(define (find-first-three-primes start) 
  (define (iter n counter) 
    (cond ((and (prime? n) (= counter 2)) (timed-prime-test n)) 
          ((prime? n) 
           (timed-prime-test n)
           (iter (+ n 1) (+ counter 1))) 
          (else (iter (+ n 1) counter))))
  (iter start 0))

(define (timed-prime-test n) 
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time) 
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (prime? n) 
  (= n (smallest-divisor n)))
