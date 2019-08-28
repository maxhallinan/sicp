#lang sicp
; Write a procedure fring that takes as argument a tree (represented as a list)
; and returns a list whose elements are all the leaves of the tree arranged in
; left-to-right order.

(define x (list (list 1 2) (list 3 4)))
; (fringe x) -> (1 2 3 4)
; (fringe (list x x)) -> (1 2 3 4 1 2 3 4)

(define (fringe t) 
  (fold-tree (lambda (acc l) (append acc (list l))) '() t))

(define (fold-tree f acc t)
  (cond ((null? t) acc) 
        ((not (pair? (car t))) (fold-tree f (f acc (car t)) (cdr t))) 
        (else (fold-tree f (fold-tree f acc (car t)) (cdr t)))))

(define bar (fringe x))
