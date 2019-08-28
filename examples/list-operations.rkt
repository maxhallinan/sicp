#lang sicp

(define (append xs ys)
  (cond ((null? xs) ys)
        ((null? ys) xs)
        (else (cons (car xs) (append (cdr xs) ys)))))

(define (last-pair xs)
  (if (null? (cdr xs))
      xs
      (last-pair (cdr xs))))

(define (reverse xs) 
  (if (null? xs) 
      xs
      (append (reverse (cdr xs)) 
              (cons (car xs) '()))))
