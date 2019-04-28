#lang sicp

; 10000 should take √10 times longer than 1000
; √10 = ~3.16

; 1000
; 1009 *** 4
; 1013 *** 6
; 1019 *** 6

; 10000
; 10007 *** 10
; 10009 *** 10
; 10037 *** 16

; (36 / 3) / ( 16 / 3) = 2.25 times longer

; 100000
; 100003 *** 40
; 100019 *** 50
; 100043 *** 49
; 139

; 1000000
; 1000003 *** 99
; 1000033 *** 103
; 1000037 *** 102
; 304

; (304 / 3) / (139 / 3) = 2.19

; 100000000
; 100000007 *** 865
; 100000037 *** 250
; 100000039 *** 251
; 1366

; 1000000000
; 1000000007 *** 818
; 1000000009 *** 785
; 1000000021 *** 750
; 2353

; (2353 / 3) / (1366 / 3) = 1.72

; 10000000000
; 10000000019 *** 2719
; 10000000033 *** 2284
; 10000000061 *** 2304
; 7307

; (7307 / 3) / (2353 / 3) = 3.10539736507

; 100000000000
; 100000000003 *** 9442
; 100000000019 *** 8736
; 100000000057 *** 8422
; 26600

; (26600 / 3) / (7307 / 3) = 3.64034487478

; 1000000000000
; 1000000000039 *** 24218
; 1000000000061 *** 24894
; 1000000000063 *** 30740
; 79852

; (79852 / 3) / (26600 / 3) = 3.00195488722

; (3.11 + 3.64 + 3) / 3 = 3.25
; The increase is roughly proportional to √10, reflected most in high numbers.

(define (find-first-three-primes start) 
  (define (iter n counter) 
    (cond ((and (prime? n) (= counter 2)) (timed-prime-test n)) 
          ((prime? n) 
           (timed-prime-test n)
           (iter (+ n 1) (+ counter 1))) 
          (else (iter (+ n 1) counter))))
  (iter start 0))

(define (search-for-primes start end) 
  (cond 
    ((> start end) (newline))
    ((even? start) (search-for-primes (+ 1 start) end))
    (else 
      (timed-prime-test start)
      (search-for-primes (+ 1 start) end))))

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

(define (smallest-divisor n) 
  (define (iter test-divisor) 
    (cond ((> (square test-divisor) n) n) 
          ((divides? test-divisor n) test-divisor) 
          (else (iter (+ 1 test-divisor)))))
  (iter 2))

(define (divides? divisor n) 
  (= 0 (remainder n divisor)))

(define (square n) 
  (* n n))

(define (even? n) 
  (= 0 (remainder n 2)))
