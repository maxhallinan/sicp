#lang sicp

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle) 
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))

#|
a. `p` is applied 5 times:
(sine 12.15)
(p (sine 4.05))
(p (p 1.35))
(p (p (p 0.45)))
(p (p (p (p 0.15))))
(p (p (p (p (p 0.05)))))

b. O(log n) for time and space because it's increasing linearly with the order 
of magnitude for n.

It looks like log n + 2:

(sine 1)
(p (sine 0.33))
(p (p (sine 0.11)))
(p (p (p (sine 0.04))))
3 steps

(sine 10)
(p (sine 3.33))
(p (p (sine 1.11)))
(p (p (p (sine 0.37))))
(p (p (p (p (sine 0.12)))))
(p (p (p (p (p (sine 0.04))))))
5 steps 

(sine 100)
(p (sine 33.33))
(p (p (sine 11.11)))
(p (p (p (sine 3.7))))
(p (p (p (p (sine 1.23)))))
(p (p (p (p (p (sine 0.41))))))
(p (p (p (p (p (p (sine 0.14)))))))
(p (p (p (p (p (p (p (sine 0.04))))))))
7 steps

(sine 1000)
(p (sine 333.33))
(p (p (sine 111.11)))
(p (p (p (sine 37.03))))
(p (p (p (p (sine 12.35)))))
(p (p (p (p (p (sine 4.12))))))
(p (p (p (p (p (p (sine 1.37)))))))
(p (p (p (p (p (p (p (sine 0.46))))))))
(p (p (p (p (p (p (p (p (sine 0.15)))))))))
(p (p (p (p (p (p (p (p (p (sine 0.15))))))))))
(p (p (p (p (p (p (p (p (p (p (sine 0.05)))))))))))
10 steps 

(sine 10000)
(p (sine 3333.33))
(p (p (sine 3333.33)))
(p (p (p (sine 1111.11))))
(p (p (p (p (sine 370.37)))))
(p (p (p (p (p (sine 123.45))))))
(p (p (p (p (p (p (sine 123.45)))))))
(p (p (p (p (p (p (p (sine 41.15))))))))
(p (p (p (p (p (p (p (p (sine 13.72)))))))))
(p (p (p (p (p (p (p (p (p (sine 4.57))))))))))
(p (p (p (p (p (p (p (p (p (p (sine 1.52)))))))))))
(p (p (p (p (p (p (p (p (p (p (p (sine 0.51))))))))))))
(p (p (p (p (p (p (p (p (p (p (p (p (sine 0.17)))))))))))))
(p (p (p (p (p (p (p (p (p (p (p (p (p (sine 0.06))))))))))))))
13 steps
|#
