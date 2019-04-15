#lang sicp

(eq? 10 10)

(eq? (+ 5 3 4) 12)

(eq? (- 9 1) 8)

(eq? (/ 6 2) 3)

(eq? (+ (* 2 4) (- 4 6)) 6)

(define a 3)
; not usable in an expression context

(define b (+ a 1))
; not usable in an expression context

(eq? (+ a b (* a b)) 19)

(eq? (eq? a b) #f)

(eq? 
  (if (and 
      (> b a) 
      (< b (* a b))) 
    b
    a)
  4)

(eq? (cond 
    ((eq? a 4) 6) 
    ((eq? b 4) (+ 6 7 a)) 
    (else 25))
   16)

(eq? 
  (+ 2 (if (> b a) b a))
  6)

(eq? (* 
     (cond 
       ((> a b) a) 
       ((< a b) b) 
       (else -1)) 
     (* a 1))
   12)
