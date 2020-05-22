#lang racket/base
; 递归版本
(define (f n)
  (cond ((< n 3) n)
        (else
         (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))

(f 4)
(+ (f 3) (* 2 (f 2)) (* 3 (f 1)))
(+ (f 2) (* 2 (f 1)) (* 3 (f 0)) (* 2 (f 2)) (* 3 (f 1)) )
(+ 2 2 0 4 3 )


#| 迭代版本
迭代版本的关键需要找到他们的联系
当n >= 3时
f(3) = f(2) + 2f(1) + 3f(0)

f(4) = f(3) + 2f(2) + 3f(1)

f(5) = f(4) + 2f(3) + 3f(2)
发现规律为
f(n) = f(n-1) + 2f(n-2) + 3f(n-3)
用a表示 f(2) b表示 f(1) c表示 f(0)则有
f(3) = a + 2b + 3c
之后和斐波那契的迭代采用一样的方法就行了
a <-- a + 2b + 3c
b <-- a
c <-- b
|#

(define (f n)
  (f-iter 2 1 0 n))

(define (f-iter a b c counter)
  (cond ((= counter 0) c)
        (else (f-iter (+ a (* 2 b) (* 3 c))
                      a
                      b
                      (- counter 1)))))
(f 4)
(f-iter 2 1 0 4)
(f-iter 4 2 1 3)
(f-iter 11 4 2 2)
(f-iter 25 11 4 1)
(f-iter 59 25 11 0)


