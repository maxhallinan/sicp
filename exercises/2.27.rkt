#lang sicp

; Modify your reverse procedure of Exercise 2.18 to produce a deep-reverse 
; procedure that takes a list as an argument and returns as its value the list 
; with its eleemnts reversed and with all sublists deep-reversed as well.

(define x (list 1 2 3))
(define y (list 4 5 6))

(define (deep-reverse xs)
  (cond ((null? xs) xs)
        ((pair? (car xs)) (append (deep-reverse (cdr xs)) 
                                  (deep-reverse (car xs))))
        (else (append (deep-reverse (cdr xs)) 
                      (list (car xs))))))

(define foo (deep-reverse (cons x y)))
