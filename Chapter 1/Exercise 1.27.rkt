#lang racket/base
(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m)) m))))


(define (carmichael n)
  (test-iter 1 n))

(define (test-iter a n)
  (cond ((= a n) #t)
        ((= a (expmod a n n)) (test-iter (+ 1 a) n))
        (else #f)))

(carmichael 561)
(carmichael 1105)
(carmichael 1729)
(carmichael 2465)
(carmichael 2821)
(carmichael 6601)