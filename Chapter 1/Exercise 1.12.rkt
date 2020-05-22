#lang racket/base
; 递归版本的pascal
(define (pascal row col)
  (cond
     ((or (> col row) (< col 0) (<= row 0) )
        (error "invalid value"))       
    ((or (= col 1) (= row col)) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))


(pascal 5 3)


(define (factrial n)
  (fac-iter 1 1 n))

(define (fac-iter count product max-counter)
  (if (> count max-counter)
      product
      (fac-iter (+ count 1) (* count product)  max-counter )))

; 迭代版本的pascal
(define (pascal row col)
  (cond  ((or (> col row) (< col 0) (< row 0))
        (error "invalid value"))
         (else
          (/ (factrial row)
             (* (factrial col) (factrial (- row col)))))
))

(pascal 4 2)