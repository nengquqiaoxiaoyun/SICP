#lang racket/base
(define (square x)
  (* x x))

(define (runtime) 
     (current-milliseconds))

; find smallest divisor
(define (smallest-divisor n)
      (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

; 除的尽说明最小公因数就是a
(define (divides? a b)
  (= (remainder b a) 0 ))

(define (prime? n)
  ( = (smallest-divisor n) n))


(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      (display "")))

(define (report-prime n elapsed-time)
   
  (display n)
  (display " *** ")
  (display elapsed-time)
 (newline)
 )

(define (seach-for-prime lower upper)
  (define (iter n)
    (cond ((<= n upper)
           (timed-prime-test n)
           (iter (+ n 2)))))
  (iter
   (if (odd? lower)
      lower
      (+ lower 1))))

(seach-for-prime 10000 10099)


