#lang sicp

(define (fib n) 
  (cond ((= n 0) 0) 
        ((= n 1) 1) 
        (else (+ (fib (- n 1)) 
                 (fib (- n 2))))))

#|
exponential growth is f(n) = 2^n
the number of times the procedure will compute (fib 1) or (fib 0) (the number of leaves in the above tree, in general) is precisely Fib(n + 1)
|#
; 0 steps
(fib 0)

; 0 steps
(fib 1)

; 1 step
(fib 2)
(+ (fib 1) (fib 0))

; 2 steps
(fib 3)
(+ (fib 2) (fib 1))
(+ (+ (fib 1) (fib 0)) (fib 1))

; 4 steps
(fib 4)
(+ (fib 3) (fib 2))
(+ (+ (fib 2) (fib 1)) (fib 2))
(+ (+ (+ (fib 1) (fib 0)) (fib 1)) (fib 2))
(+ (+ (+ (fib 1) (fib 0)) (fib 1)) (+ (fib 1) (fib 0)))

#|
(fib 4) = 4 steps
(fib 3) = 2 steps
4 * 2 = 8 steps
|#
(fib 5)
(+ (fib 4) (fib 3))
(+ (+ (fib 3) (fib 2)) (fib 3))
(+ (+ (+ (fib 2) (fib 1)) (fib 2)) (fib 3))
(+ (+ (+ (+ (fib 1) (fib 0)) (fib 1)) (fib 2)) (fib 3))
(+ (+ (+ (+ (fib 1) (fib 0)) (fib 1)) (+ (fib 1) (fib 0))) (fib 3))
(+ (+ (+ (+ (fib 1) (fib 0)) (fib 1)) (+ (fib 1) (fib 0))) (+ (fib 2) (fib 1)))
(+ (+ (+ (+ (fib 1) (fib 0)) (fib 1)) (+ (fib 1) (fib 0))) (+ (+ (fib 1) (fib 0)) (fib 1)))

#|
(fib 5) = 8 steps
(fib 4) = 4 steps
32 steps
|#
(fib 6)
(+ (fib 5) (fib 4))
