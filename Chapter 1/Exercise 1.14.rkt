#lang racket/base

(define (count-change amount)
  (cc amount 5))

(define (kinds-of-amout kind)
  (cond ((= kind 1) 1)
        ((= kind 2) 5)
        ((= kind 3) 10)
        ((= kind 4) 25)
        ((= kind 5) 50)))

(define (cc amount kind)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kind 0)) 0)
        (else (+ (cc amount (- kind 1))
                 (cc (- amount (kinds-of-amout kind)) kind)))))

(count-change 10)


(cc 11 5)
(+ (cc 11 4) (cc -39 5))
(+ (cc 11 3) (cc -14 4) (cc -39 5))
(+ (cc 11 2) (cc 1 3) (cc -14 4)  (cc -39 5))
(+ (cc 11 2) (cc 1 2) (cc -9 3) (cc -14 4)  (cc -39 5))
(+ (cc 11 2) (cc 1 1) (cc -4 2) (cc -9 3) (cc -14 4)  (cc -39 5))
(+ (cc 11 2) (cc 1 0) (cc 0 1) (cc -4 2) (cc -9 3) (cc -14 4)  (cc -39 5))
(+ (cc 11 2) (cc 11 1) (cc 6 2) (cc 1 0) (cc 0 1) (cc -4 2) (cc -9 3) (cc -14 4)  (cc -39 5))
...
