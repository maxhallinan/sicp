#lang sicp

(define (expmod base exp m)
  (cond ((= exp 0) 1) 
        ((even? exp) 
         (remainder (* (expmod base (/ exp 2) m) 
                       (expmod base (/ exp 2) m)) 
                    m)) 
        (else 
          (remainder (* base (expmod base (- exp 1) m)) m))))

(define (even? n) 
  (= 0 (remainder n 2)))

#|
The substitution method shows that the worst case is roughly 2n.
2n ~ O(n)

(expmod 10 1 9)
(remainder (* 10 (expmod 10 0 9)) 9)
1 steps

(expmod 10 2 9)
(remainder (* (expmod 10 1 9) (expmod 10 1 9)) 9) 
(remainder (* (remainder (* 10 (expmod 10 0 9)) 9) (expmod 10 1 9)) 9) 
(remainder (* 1 (remainder (* 10 (expmod 10 0 9)) 9)) 9) 
(remainder (* 1 (remainder (* 10 1) 9)) 9) 
4 steps

(expmod 10 3 9)
(remainder (* 10 (expmod 10 2 9)) 9)
...
5 steps

(expmod 10 4 9)
(remainder (* (expmod 10 2 9) (expmod 10 2 9)) 9) 
...
8 steps

(expmod 10 5 9)
(remainder (* 10 (expmod 10 4 9)) 9)
...
9 steps
|#
