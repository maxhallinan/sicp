#lang sicp

#|
O(log n) growth means that 1000000 takes 3 times as long as 1000
log grows linearly with increases in order of magnitude
6 = log(1000000)
5 = log(100000)
4 = log(10000)
3 = log(1000)
2 = log(100)
1 = log(10)

1000
1009 *** 21
1013 *** 21
1019 *** 20
Total: 62

1000000
1000003 *** 29
1000033 *** 28
1000037 *** 28
Total: 85
|#


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
  (fast-prime? n 4))

(define (fast-prime? n times) 
  (cond ((= times 0) true) 
        ((fermat-test n) (fast-prime? n (- times 1))) 
        (else false)))

(define (fermat-test n) 
  (define (try-it a) 
    (= (expmod a n n) a)) 
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m) 
  (cond ((= exp 0) 1) 
        ((even? exp) 
          (remainder (square (expmod base (/ exp 2) m)) m)) 
        (else 
          (remainder (* base (expmod base (- exp 1) m)) m))))

(define (divides? divisor n) 
  (= 0 (remainder n divisor)))

(define (square n)
  (* n n))

(define (even? n) 
  (= 0 (remainder n 2)))
