#lang racket/base

(define (square x)
  (* x x))

(define (runtime) 
     (current-milliseconds))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m)) m))))


(define (fermat-test n)
  (define (try-it a)
    (= a (expmod a n n)))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (prime? n)
  (fast-prime? n 7))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n )
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
