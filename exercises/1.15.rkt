#lang sicp

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle) 
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))

; `p` is applied 5 times:
; (sine 12.15)
; (p (sine 4.05))
; (p (p 1.35))
; (p (p (p 0.45)))
; (p (p (p (p 0.15))))
; (p (p (p (p (p 0.05)))))
