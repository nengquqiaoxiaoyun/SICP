#lang racket/base

(define (even? n)
  (= (remainder n 2) 0))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (fast-expt b n)
  (expt-iter b n 1))

(define (expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (expt-iter (* b b) (/ n 2) a))
        (else (expt-iter b (- n 1) (* b a)))))

(define (multi a b)
  (cond ((= b 0) 0)
        ((even? b)  (double (multi a (halve b))))
        (else (+ a (multi a (- b 1))))))

(define (mul a b)
  (multi-iter a b 0))

(define (multi-iter a b product)
  (cond ((= b 0) product)
        ((even? b) (multi-iter (double a) (halve b) product))
        (else (multi-iter a (- b 1) (+ a product)))))

(mul 3 9)
