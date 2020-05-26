#lang racket/base

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (expt b n 1))

(define (expt b n a)
  (cond ((= n 0) a)
        ((even? n) (expt (* b b) (/ n 2) a))
        (else (expt b (- n 1) (* b a)))))

(fast-expt 2 10)