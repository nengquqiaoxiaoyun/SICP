#lang racket/base
(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((extraordinary base m) 0)
        ((even? exp)  (remainder
          (square (expmod base (/ exp 2) m)) m))
        ((odd? exp) (remainder
          (* base (expmod base (- exp 1) m)) m))))

(define (miller-rabin n)
  (define (try-it a)
    (= (remainder 1 n) (expmod a (- n 1) n)))
  (try-it (+ 1 (random (- n 1)))))

(define (extraordinary a n)
  (and (not (= a 1))
       (not (= a (- n 1)))
       (= 1 (remainder (square a) n))))

(define (miller-test n times)
  (cond ((= 0 times) #t)
        ((miller-rabin n) (miller-test n (- times 1)))
        (else #f)))

(define (miller n)
  (miller-test n (ceiling (/ n 2))))

(miller 19)
(miller 561)
(miller 1105)
(miller 1729)
(miller 2465)
(miller 2821)
(miller 6601)


