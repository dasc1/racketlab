#lang racket

(define (sum-3-5 acc next target)
  (cond [(> next target) acc]
        [(= (remainder next 3) 0) (sum-3-5
                                   (+ acc next)
                                   (+ next 1)
                                   target)]
        [(= (remainder next 5) 0) (sum-3-5
                                   (+ acc next)
                                   (+ next 1)
                                   target)]
        [#t (sum-3-5 acc (+ next 1) target)]))
        
(sum-3-5 0 1 999)