#lang sicp

(define (tree-map f tree) 
  (map (lambda (node) 
         (cond ((null? node) node) 
               ((pair? node) (tree-map f node)) 
               (else (f node)))) 
       tree))
(define (square-tree tree) (tree-map square tree))
(define (square n) (* n n))
(define foo (list 1 
                  (list 2 (list 3 4) 5) 
                  (list 6 7)))
(define bar (square-tree foo))

