#lang racket/base
; 定义一个三个参数的过程，返回两个较大的数之和

; bigger 返回较大的那个数
(define (bigger a b)
  (cond ((> a b) a)
  (else b)))

; smaller 返回较小的那个数
(define (smaller a b)
  (cond ((> a b) b)
  (else a)))

; square 返回值的平方
(define (square x) (* x x))

; 求两个较大数之和
(define (sumOfTwoLargerNumbers a b c)
  (+  (bigger a b)
      (bigger (smaller a b) c)))

; 求两较大数平方和
(define (squareOfTwoLargerNumbers a b c)
  (+  (square (bigger a b))
      (square (bigger (smaller a b) c))))

(sumOfTwoLargerNumbers -1 -2 -3)

(squareOfTwoLargerNumbers -1 -2 -3)


 