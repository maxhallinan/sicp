#lang sicp

(define (for-each f res xs)
  (cond ((null? xs) res)
        (else (f (car xs)) 
              (for-each f res (cdr xs)))))

(define foo (for-each (lambda (x) (display x)) -1 '(1 2 3 4 5)))
