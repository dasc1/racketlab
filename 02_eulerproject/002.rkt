#lang racket

(define (fibsum acc a b limit)
  (letrec ([c (+ a b)])
    (cond [(>= c limit) acc]
          [(= 0 (remainder c 2))
           (fibsum (+ acc c) b c limit)]
          [#t (fibsum acc b c limit)])))

(fibsum 2 1 2 4000000)