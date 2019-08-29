#lang sicp

; We can represent a set as a list of distinct elements, and we can represent
; the set of all subsets of the set as a list of lists.
; For example, the set is (1 2 3), then the set of all subsets is 
; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

(define (subsets s)
  (if (null? s)
    (list nil)
    (let ((rest (subsets (cdr s))))
      (append rest (map (lambda (x) 
                          (list (car s) x)) rest)))))
(define foo '(1 2 3))
(define bar (subsets foo))

; (subsets '(1))
; (append (subsets '()) (map () '()))
; I don't exactly get why this works.
; What's going on here?
; Initially I was confused how this works: (subset '(1))
; Because I thought it was mapping over `(cdr s)`, which is `'()` when there's 
; only one item.
; I overlooked that it's mapping over `(subsets (cdr s))`.
; And subsets puts the empty list in another list, so there is something to map
; over.
; This is essentially a tree traversal.
; Every branch is visited.
; The list is a like tree where the subtrees are all on the right side.
; Each combines each left leaf with all of the subsets of the right subtree.

; (subsets '(1))
; (append (subsets '()) (map (lambda (x) (list (car s) x)) (subsets '())))
; (append '(()) (map (lambda (x) (list (car s) x)) '(())))
; (append '(()) '((1)))
; '(() (1))

; (subsets '(1 2))
; (append '(() (2 ())) (map (lambda (x) (list (car s) x)) '(() (2 ()))))
; (append '(() (2 ())) (map (lambda (x) (list (car s) x)) '(() (2 ()))))
; (append (subsets '(2)) '((1 2)))
; (append (append ('()) '(2 ())) '((1 2)))
; (append '(() (2 ())) '((1 2)))
; (() (2 ()) (1 2))
