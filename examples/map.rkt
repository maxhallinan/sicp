#lang sicp

(define (map f xs) 
  (if (null? xs)
    xs
    (cons (f (car xs)) 
          (map f (cdr xs)))))

(define (scale-list factor xs)
  (map (lambda (x) (* x factor)) 
       xs))

