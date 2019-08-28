#lang sicp

; Calculate the number of ways to make change for the given amount using the 
; given coins.
(define (cc amount coin-values)
        ; If amount is 0, there is 1 way to make change.
  (cond ((= amount 0) 1) 
        ; If amount is less than 0 OR there are no coin values, there are 0 ways
        ; to make change.
        ((or (< amount 0) (no-more? coin-values)) 0) 
        (else 
             ; Calculate the number of ways to make change, using all coin values
             ; except the first.
          (+ (cc amount (except-first-denomination coin-values)) 
             ; Calculate the number of ways to make change for the amount minus
             ; the first denomination.
             (cc (- amount (first-denomination 
                            coin-values))
                 coin-values)))))

(define (first-denomination coin-values) (car coin-values))
(define (except-first-denomination coin-values) (cdr coin-values))
(define (no-more? coin-values) (null? coin-values))

; Does the order of the coin-values effect the answer produced by cc?
; It seems not to: (cc 100 '(1 5 10 25 50)), (cc 100 '(50 25 10 5 1)), and 
; (cc 100 '(1 50 25 10 5)) all produce 292.
; Why is this?
; Because this is tree recursion, which visits all subtrees regardless of order.
