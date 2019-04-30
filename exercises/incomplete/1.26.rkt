#lang sicp

#|
Tree recursion grows exponentially with the depth of the tree.
The depth of the tree is `log N`.
The exponential growth of `log N` is linear growth.
Exponential growth is f(x) = 2^x

2^(log N)

log(1) = 0
2^(log 1) = 1

log(10) = 1
2^(log 10) = 2

log(100) = 2
2^(log 100) = 4

log(1000) = 3
2^(log 1000) = 8

log(10000) = 4
2^(log 1000) = 16

https://stackoverflow.com/a/4852666
https://softwareengineering.stackexchange.com/a/194436
https://codology.net/post/sicp-solution-exercise-1-26/
|#

(define (expmod base exp m) 
  (cond ((= exp 0) 1) 
        ((even? exp) 
         (remainder (* (expmod base (/ exp 2) m) 
                       (expmod base (/ exp 2) m)) 
                    m)) 
        (else 
          (remainder (* base 
                        (expmod base (- exp 1) m))
                     m))))
