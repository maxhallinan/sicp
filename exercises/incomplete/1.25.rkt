#lang sicp

#|
With expmod-1
1009 *** 44
1013 *** 7
1019 *** 7

With expmod-2
1009 *** 59
1013 *** 49
1019 *** 60
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
  (run-fermat n 3))

(define (run-fermat n times) 
  (cond ((= times 0) true) 
        ((fermat-test n) (run-fermat n (- times 1)))
        (else false)))

(define (fermat-test n) 
  (define (try-it a) 
    (= (expmod-2 a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod-1 base exp m)
  (cond ((= exp 0) 1) 
        ((even? exp) 
         (remainder (square (expmod-1 base (/ exp 2) m)) 
                    m)) 
        (else 
          (remainder (* base (expmod-1 base (- exp 1) m)) m))))

(define (expmod-2 base exp m) 
  (remainder (fast-expt base exp) m))

(define (fast-expt b n) 
  (cond ((= n 0) 1) 
        ((even? n) (square (fast-expt b (/ n 2)))) 
        (else (* b (fast-expt b (- n 1))))))

(define (even? n) 
  (= 0 (remainder n 2)))

(define (square n) 
  (* n n))

(define (divides? divisor n) 
  (= 0 (remainder n divisor)))
