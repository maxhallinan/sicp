#lang sicp

(define (factorial-recursive x) 
  (if (= x 1) 
    x
    (* x (factorial-recursive (- x 1)))))

(= (factorial-recursive 6) 720)

(define (factorial-iterative x) 
  (define (iter counter product) 
    (if (= counter x) 
      product
      (iter (+ counter 1) (* product counter))))
  (iter 1 x))

(= (factorial-iterative 6) 720)
