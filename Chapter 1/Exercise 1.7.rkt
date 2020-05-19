#lang racket/base
; 给出猜测值和被开方的值x 求根号x

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
     (improve guess x)
      (sqrt-iter (improve guess x) x)))

(define (good-enough? oldVal newVal)
  (< (/ (abs (- newVal oldVal)) oldVal) 0.01))

(define (improve guess x)
  (average guess x))

(define (average guess x)
  (/ (+ guess (/ x guess)) 2))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 0.00009)