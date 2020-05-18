#lang racket/base

; if 是一种特殊形式，而new-if则不是
; 根据解释器所使用的应用序求值规则,
; 每个函数的实际参数在传入的时候都会被求值,
; 因此,当使用 new-if 函数时,无论 predicate 是真还是假,
; then-clause 和 else-clause 两个分支都会被求值。
; 无论测试结果如何, sqrt-iter 都会一直递归下去。
; (new-if #t (display 0) (display 1)) 将会输出 01 或者 10

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))


(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0001))

(define (square x)
  (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 2)