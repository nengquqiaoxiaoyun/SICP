#lang racket/base

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))
; a) 调用了五次p 对于求值 (sine a) a每/3 就将调用一次 p 12.15除了5次3
; 在求值 (sine a) 的时候, a 每次都被除以 3.0 ,而 sine 是一个递归程序,因此它的时间和空间复杂度都是 O(loga) 
