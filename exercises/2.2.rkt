#lang sicp
; Representing line segments in a plane.
; Each segment is represented by a pair of points: start and end.

(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (midpoint-segment segment) 
  (make-point (avg-x segment) 
              (avg-y segment)))

(define (avg-x segment) (avg-segment-point x-point segment))

(define (avg-y segment) (avg-segment-point y-point segment))

(define (avg-segment-point get-point segment)
  (avg (get-point (start-segment segment))
       (get-point (end-segment segment))))

(define (avg x y) (/ (+ x y) 2))

(define foo (make-point 8 4))
(define bar (make-point 6 2))
(define baz (make-segment foo bar))
