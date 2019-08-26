#lang sicp
; Implement a representation for rectangles in a plane.
; Create procedures that compute the perimeter and the area of a given
; rectangle.
; Now implement a different representation for rectangles.

(define (make-rect top-left top-right bottom-left bottom-right)
  (cons (cons top-left top-right)
        (cons bottom-left bottom-right)))

(define (top-left rect) (car (car rect)))
(define (top-right rect) (cdr (car rect)))
(define (bottom-left rect) (car (cdr rect)))
(define (bottom-right rect) (cdr (cdr rect)))

(define (rect-width rect) 
  (+ (x-point (top-left rect)) 
     (x-point (top-right rect))))

(define (rect-height rect) 
  (+ (y-point (top-left rect)) 
     (y-point (bottom-left rect))))

(define (rect-area rect)
  (* (rect-height rect)
     (rect-width rect)))

(define (rect-perim rect)
  (* 2 (+ (rect-height rect)
          (rect-width rect))))

(define (make-point x y) 
  (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define foo (make-rect 
              (make-point 0 0) 
              (make-point 5 0) 
              (make-point 0 5) 
              (make-point 5 5)))
