#lang sicp

; A binary mobile consists of two branches, a left branch and a right branch.
; Each branch is a rod of a certain length, from which hangs either a weight or
; another binary mobile. We can represent a binary mobile using compound data by
; constructing it from two branches (for example, using list):


; A branch is constructed from a `length` (which must be a number) together with 
; a `structure`, which may be either a number (representing a simple weight) or
; another mobile:

#| This representation uses `list` instead of `cons`.
   Even when changing the underlying representation, only have to update 
   getters and setters.
|#
#| (define (make-mobile left right) (list left right)) |#
#| (define (make-branch length structure) |# 
#|   (list length structure)) |#
#| (define (right-branch mobile) (car (cdr mobile))) |#
#| (define (branch-structure branch) (car (cdr branch))) |#

(define (make-mobile left right) (cons left right))
(define (make-branch length structure) (cons length structure))
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cdr mobile))
(define (branch-length branch) (car branch))
(define (branch-structure branch) (cdr branch))
(define (total-weight m)
  (+ (branch-weight (left-branch m)) 
     (branch-weight (right-branch m))))
(define (branch-weight b)
 (fold-branch (lambda (acc weight) (+ acc weight)) 0 b))
(define (fold-branch f acc b)
  (cond ((not (pair? (branch-structure b))) (f acc (branch-structure b))) 
        (else (fold-branch f acc (branch-structure b)))))
(define foo (make-mobile (make-branch 1 1) (make-branch 1 2)))
(define bar (total-weight foo))

; A mobile is said to be balanced if the torque applied by its top-left branch
; is equal to that applied by its top-right branch (that is, if the length of 
; the left rode multiplied by the weight hanging from that rod is equal to the 
; corresponding product for the right side) and if each of the submobiles 
; hanging off its branches is balanced. Design a predicate that tests whether a
; binary mobile is balanced.
(define (mobile-balanced? m)
  (equal? (branch-torque (left-branch m)) 
          (branch-torque (right-branch m))))
(define (branch-torque b)
  (* (branch-length b)
     (branch-weight b)))
(define baz (mobile-balanced? (make-mobile (make-branch 1 (make-branch 2 6)) 
                                           (make-branch 3 (make-branch 2 3)))))
; #f
(define qux (mobile-balanced? (make-mobile (make-branch 1 (make-branch 2 6)) 
                                           (make-branch 2 (make-branch 2 3)))))
; #t
