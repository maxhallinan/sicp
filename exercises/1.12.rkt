#lang sicp

;      1
;     1 1
;    1 2 1
;   1 3 3 1
;  1 4 6 4 1
; Pascal's triangle
(define (p row col) 
  (if (or (<= col 1) (>= col row)) 
    1
    (+ (p (- row 1) (- col 1)) 
       (p (- row 1) col))))
