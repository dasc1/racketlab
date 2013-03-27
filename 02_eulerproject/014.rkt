#lang racket

(define (collatz iters num)
  (cond [(= num 1) iters]
        [(= (remainder num 2) 0) (collatz (+ iters 1) (/ num 2))]
        [#t (collatz (+ iters 1) (+ 1 (* 3 num)))]))

(define limit 1000000)

(define (findlong num bestn bestl)
  (define coll (collatz 0 num))
  (cond [(> num limit) (cons bestn bestl)]
        [(> coll bestl) 
         (findlong (+ num 1) num coll)]
        [#t (findlong (+ num 1) bestn bestl)]))

(findlong 500000 0 0)