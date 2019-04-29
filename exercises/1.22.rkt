#lang sicp

#|
1000000000
1000000007 *** 818
1000000009 *** 785
1000000021 *** 750
Total: 2353

10000000000
10000000019 *** 2719
10000000033 *** 2284
10000000061 *** 2304
Total: 7307

100000000000
100000000003 *** 9442
100000000019 *** 8736
100000000057 *** 8422
Total: 26600

1000000000000
1000000000039 *** 24218
1000000000061 *** 24894
1000000000063 *** 30740
Total: 79852

(7307 / 3) / (2353 / 3) = 3.10539736507
(26600 / 3) / (7307 / 3) = 3.64034487478
(79852 / 3) / (26600 / 3) = 3.00195488722

(3.11 + 3.64 + 3) / 3 = 3.25
The increase is roughly proportional to √10
|#

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
