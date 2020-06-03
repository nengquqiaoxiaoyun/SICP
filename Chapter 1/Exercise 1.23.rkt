#lang racket/base
(define (square x)
  (* x x))

(define (runtime) 
     (current-milliseconds))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #f))

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (search-for-primes n count)
  (if (even? n)
      (s-f-p (+ n 1) count)
      (s-f-p n count)))

(define (s-f-p n count)
  (if (> count 0)
      (if (timed-prime-test n)
          (s-f-p (+ n 2) (- count 1))
          (s-f-p (+ n 2) count))
      "computation complate"))


(search-for-primes 1000 3)
(search-for-primes 10000 3)
(search-for-primes 100000 3)
(search-for-primes 1000000 3)
