#lang sicp

; There is a clever algorithm for computing the Fibonacci numbers in a
; logarithmic number of steps.
; Recall the transformation of state variables a and b in the fib-iter process
; of section 1.2.2: a <- a + b and b <- a.
; Call this transformation T, and observe that applying T over and over again n
; times, starting with 1 and 0, produces the pair Fib(n+1) and Fib(n).
; In other words, the Fibonacci numbers are produced by applying T^n, the nth power
; of the transformation T, starting with pair (1,0).
; Now consider T to be the special case of p = 0 and q = 1 in a family of
; transformations Tpq, where Tpq transforms the pair (a,b) according to
; a <- bq + aq + ap and b <- bp + aq.
; Show that if we apply such a transformation Tpq twice, the effect is the same
; as using a single transformation Tp'q' of the same form, and compute p' and q'
; in terms of p and q.
; This gives us an explicite way to square these transformations, and thus we
; can compute T^n using successive squaring, as in the fast-expt procedure.

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b x y count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (square (fib-iter 1 0 0 1 y))
                   (+ x 1)
                   (/ count 2)))
        (else (fib-iter (+ (* b y) (* a y) (* a x))
                        (+ (* b x) (* a y))
                        x
                        y
                        (- count 1)))))

(define (square n)
  (* n n))

(define (even? n)
  (= 0 (remainder n 2)))

(= 0 (fib 1))
(= 1 (fib 2))
(= 1 (fib 3))
(= 2 (fib 4))
(= 3 (fib 5))
(= 5 (fib 6))
(= 8 (fib 7))
(= 13 (fib 8))
(= 21 (fib 9))
(= 34 (fib 10))
