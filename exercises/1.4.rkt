#lang sicp

(define (a-plus-abs-b a b) 
  ((if (> b 0) + -) a b))

(eq? (a-plus-abs-b 1 2) 3)
(eq? (a-plus-abs-b 1 -2) 3)
(eq? (a-plus-abs-b -1 2) 1)
