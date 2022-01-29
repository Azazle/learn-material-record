#lang racket

(provide
 (contract-out
  [square (-> number? number?)]))

(define (square x)
  (* x x))
  
;(suqare 2)
;(square 0+1i)


