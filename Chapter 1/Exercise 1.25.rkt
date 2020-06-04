#lang racket/base

 (define (square m)  
   (display "square ")(display m)(newline) 
   (* m m)) 


; 一下过程 需要计算出 a的n次方后再做取余，当执行的数据非常大之后，效率远不如下面的expmod
; 下面的expmod 通过每次对乘幂进行 remainder 操作,从而将乘幂限制在一个很小的范围内(不超过参数 m )
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))


(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m)) m))))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else
         (* b (fast-expt b (- n 1))))))



