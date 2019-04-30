#lang sicp

; recursive process
(define (f n) 
  (cond ((< n 3) n)
        (else (+ (f (- n 1)) 
                 (* 2 (f (- n 2))) 
                 (* 3 (f (- n 3)))))))

; iterative process
(define (g n) 
  (define (iter x y z count) 
    (if (= count 0) 
      z
      (iter (+ x (* 2 y) (* 3 z)) x y (- count 1))))
  (iter 2 1 0 n))

; (f 3)
; (+ (f (- 3 1)) (* 2 (f (- 3 2))) (* 3 (f (- 3 3))))
; (+ (f 2) (* 2 (f 1)) (* 3 (f 0))) 
; (+ (f 2) (* 2 1) (* 3 0)) 
; (+ 2 2 0)
; 4

; (f 3)
; (+ (f (- 3 1)))
; (+ (f 2))

; (f 4)
; (+ (f 3) (* 2 (f 2)) (* 3 (f 1)))
; (+ (+ (f 2) (* 2 (f 1)) (* 3 (f 0))) (* 2 2) (* 3 1))
; (+ (+ (f 2) (* 2 (f 1)) (* 3 (f 0))) 4 3)
; (+ (+ (f 2) (* 2 (f 1)) (* 3 (f 0))) 4 3)
; (+ (+ 2 (* 2 1) (* 3 0)) 4 3)
; (+ (+ 2 2 0) 4 3) 
; (+ 4 4 3)
; 11

#| (define (g n) |# 
#|   (g-iter 1 1 n)) |#

#| (define (g-iter counter max-count result) |# 
#|   (if (> counter max-count) |# 
#|     result |#
#|     (g-iter |# 
#|       (+ counter 1) |#
#|       max-count |#
#|       (+ counter |#
#|          (* 2 (- counter 2)) |# 
#|          (* 3 (- counter 3)))))) |#

#| (define (g-iter max-count counter result) |# 
#|   (if (> counter max-count) |# 
#|     result |#
#|     (g-iter |# 
#|       max-count |#
#|       (+ counter 1) |#
#|       (+ (if (> counter 2) (- counter 1) counter) |#
#|          (* 2 (if (> counter 2) (- counter 2) counter)) |# 
#|          (* 3 (if (> counter 2) (- counter 3) counter)))))) |#
#| (define (h n) |#
#|   (h-iter n 0)) |#

#| (define (h-iter n result) |#
#|   (if (< n 3) |#
#|     result |#
#|     (h-iter (- n 1) |#
#|             (+ )))) |#

#| (define (k n) |#
#|   (k-iter 1 1 n)) |#

#| (define (k-iter a b c counter max-count) |# 
#|   (if (> counter max-count) |#
#|     (+ a b c) |#
#|     (k-iter (if (< counter 3) counter (- counter 1)) |# 
#|             (if (< counter 3) counter (* 2 (- counter 2))) |# 
#|             (if (< counter 3) counter (* 3 (- counter 3))) |# 
#|             (+ counter 1) |# 
#|             max-count))) |#

#| (define (k-iter result counter max-count) |# 
#|   (if (> counter max-count) |#
#|     result |#
#|     (k-iter (+ |# 
#|               (if (< 3 (+ counter 1)) counter (+ 1 counter)) |# 
#|               (if (< 3 (+ counter 2)) counter (+ 2 counter))) |# 
#|               (if (< 3 (+ counter 3)) counter (+ 3 counter)))) |#
#|             (+ counter 1) |# 
#|             max-count))) |#

#| (define (k-iter result counter max-count) |# 
#|   (cond ((< max-count 3) max-count) |#
#|         ((> counter max-count) result) |#
#|         (k-iter (+ (- counter 1) |# 
#|                    (* 2 (- counter 2)) |# 
#|                    (* 3 (- counter 3))) |# 
#|                 (+ counter 1) |# 
#|                 max-count))) |#

#| (define (g-iter result counter max-count) |# 
#|   (if (> counter 2) |# 
#|     result |#
#|     (g-iter |# 
#|       max-count |#
#|       (+ counter 1) |#
#|       (g-iter max-count (+ counter 1) ()) |#
#|       (g-iter ())))) |#

      #| (+ (if (< counter 3) counter (- counter 1)) |#
      #|    (* 2 (if (< counter 3) counter (- counter 2))) |# 
      #|    (* 3 (if (< counter 3) counter (- counter 3))))))) |#

#| (define (g-iter a b c) |# 
#|   ()) |#

#| (define (x-iter x) |# 
#|   ()) |#

#| (define (y-iter y) |# 
#|   (if (y-iter y) |# 
#|     y |#
#|     (* 2 (y-iter (y - 2))))) |#

#| (define (z-iter z) |# 
#|   (if (> z 3) |# 
#|     z |#
#|     (* 3 (z-iter (z - 3))))) |#

#| (define (k n) |# 
#|   (define (iter x y z count) |# 
#|     (if (= count 0) |# 
#|       x |#
#|       (iter (+ x y) z x (- count 1)))) |#
#|   (iter 1 0 0 n)) |#

#| (define (k n) |# 
#|   (define (iter x y z count) |# 
#|     (if (= count 0) |# 
#|       x |#
#|       (iter (+ x z) x y (- count 1)))) |#
#|   (iter 1 0 0 n)) |#


#| (f 4) |#
#| (+ (f 3) |#
#|    (* 2 (f 2)) |#
#|    (* 3 (f 1))) |#

#| (f 3) |#
#| (+ (f 2) |# 
#|    (* 2 (f 1)) |#
#|    (* 3 (f 0))) |#
#| (+ 2 2 0) |#

#| (f 2) |#
#| (+ (f 1) |# 
#|    (* 2 (f 0)) |#
#|    (* 3 (f -1))) |#

#| (define (g n) |# 
#|   (define (iter x y z count) |# 
#|     (if (= count 0) |# 
#|       x |#
#|       (iter (+ x y) z x (- count 1)))) |#
#|   (iter 0 1 2 n)) |#

#| (define (g n) |# 
#|   (define (iter x y z count) |# 
#|     (if (= count 0) |# 
#|       x |#
#|       (iter (+ x y) z x (- count 1)))) |#
#|   (iter 1 1 1 n)) |#

#| (define (g n) |# 
#|   (define (iter x y z count) |# 
#|     (if (> count n) |# 
#|       x |#
#|       (iter (+ x y) x z (+ count 1)))) |#
#|   (iter 1 0 0 1)) |#


#| (define (g n) |# 
#|   (define (iter x y z count) |# 
#|     (if (= count 0) |# 
#|       x |#
#|       (iter (+ y z) (* 2 z) (* x 3) (- count 1)))) |#
#|   (iter 1 0 0 n)) |#

; (iter 1 0 0 2)
; (iter (+ 1 0) 1 0 (- 2 1))
; (iter 1 1 0 1)
; (iter (+ 1 1) 1 0 (- 1 1))
; (iter 2 1 0 0)
; 2

; (iter 1 0 0 3)
; (iter (+ 1 0) 1 0 (- 3 1))
; (iter 1 1 0 2)
; (iter (+ 1 1) 1 1 (- 2 1))
; (iter 2 1 1 1)
; (iter (+ 2 1) 2 1 (- 1 1))
; (iter 3 2 1 0)
; 3

; (iter 2 1 0 2)
; (iter (+ 2 1) (* 2 0) (* 3 2) (- 2 1))
; (iter 3 0 6 1)
; (iter (+ 3 0) (* 2 0) (* 3 6) (- 1 1))
; (iter 3 0 18 0)
; 3

(define (fib n) 
  (cond ((= n 0) 0) 
        ((= n 1) 1) 
        (else (+ (fib (- n 1)) 
                 (fib (- n 2))))))

(define (fibb n) 
  (define (iter a b count)
    (if (= count 0) 
      b 
      (iter (+ a b) a (- count 1)))) 
  (iter 1 0 n))

(define (fac n) 
  (if (= n 1) 
    1 
    (* n (fac (- n 1)))))

(define (facc n) 
  (define (iter counter product) 
    (if (= counter 0)
      product
      (iter (- counter 1) 
            (* product counter)))) 
  (iter n 1))
