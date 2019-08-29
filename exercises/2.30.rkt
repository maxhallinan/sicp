#lang sicp

; Define a procedure `square-tree` analogous to the `square-list` procedure.
; Define `square-tree` both directly and also by using `map` and recursion.

(define (square-tree-1 tree) 
  (map (lambda (node) 
         (cond ((null? node) node)
               ((pair? node) (square-tree-1 node))
               (else (square node)))) 
       tree))
(define (square-tree-2 tree)
  (define (square-node node)
    (cond ((null? node) node) 
          ((pair? node) (square-tree-2 node)) 
          (else (square node))))
  (cond ((null? tree) tree) 
        ((pair? (car tree)) (cons (square-tree-2 (car tree)) 
                                  (square-tree-2 (cdr tree)))) 
        (else (cons (square-node (car tree)) 
                    (square-tree-2 (cdr tree))))))
        
(define (square n) (* n n))

(define foo (list 1 
                  (list 2 (list 3 4) 5) 
                  (list 6 7)))
(define bar (square-tree-1 foo))
(define baz (square-tree-2 foo))
