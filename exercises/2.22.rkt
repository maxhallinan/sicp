#lang sicp

; Why does this produce the answer in reverse:
; (square-list '(1 2 3 4)) = (16 9 4 1)
; This is happening because `(cons (square (car things)) answer)` is prepending
; each new answer to the existing answer list.
; But square-list moves left to right through the list.
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons (square (car things))
                  answer))))
  (iter items nil))
(define (square n) (* n n))
(define foo (square-list '(1 2 3 4)))
