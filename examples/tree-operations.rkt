#lang sicp

(define tree (cons (cons 1 (cons 2 nil)) (cons 3 (cons 4 nil))))

(define (count-leaves t)
  (cond ((null? t) 0) 
        ((not (pair? t)) 1)
        (else (+ (count-leaves (car t)) 
                 (count-leaves (cdr t))))))

(define (scale-tree tree factor) 
  (cond ((null? tree) nil) 
        ((not (pair? (car tree))) 
          (cons (* (car tree) factor) 
                (scale-tree (cdr tree) factor)))
        (else (cons (scale-tree (car tree) factor) 
                    (scale-tree (cdr tree) factor)))))

(define (scale-tree-2 tree factor) 
  (map (lambda (x) 
         (if (pair? x) 
             (scale-tree x factor) 
             (* x factor))) tree))
