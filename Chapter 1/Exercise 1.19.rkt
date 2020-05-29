#lang racket/base


; 通过对比 Tpq 和 (Tpq)^2 ,可以得出变换 Tp′q′ ,其中 p′=p^2+q^2 并且 q′=2pq+q^2 

(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))   
                   (+ (* 2 p q) (square q))     
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))


(fib 9)