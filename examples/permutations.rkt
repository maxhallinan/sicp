#lang racket

; For each item x in s, recursively generate the sequence of permutations s - x
; and join x to the front of each.
; This will give you all permutations, e.g. for 
; 123: [[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]]
(define (permutations s) 
  (if (null? s) 
      (list nil) ; if an empty list, then return a list containing an empty set
      ; this lambda to flatmap returns a list of lists and each of the outer 
      ; lists are concatenated
      ; for each x in s, map over the permutations of x removed from s
      ; append x to each of these permutations
      (flatmap (lambda (x) 
                  (map (lambda (p) (cons x p)) 
                       (permutations (remove x s)))) 
               s)))
