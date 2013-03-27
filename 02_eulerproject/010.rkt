#lang racket

(define limit 2000000)

(define twomil (list->vector (range limit)))

(define (elimmults start amt)
  (if (>= start limit) #t
      (begin (vector-set! twomil start 0) (elimmults (+ start amt) amt))))

(define (findprimes sum current)
  (cond [(>= current limit) sum] ; found all the primes
        [(= 0 (vector-ref twomil current)) ; mult. of lower num - skip it
         (findprimes sum (+ current 2))]
        [#t (begin (elimmults (* 2 current) current)
                   (findprimes (+ sum current) (+ current 2)))]))
        
(+ 2 (findprimes 0 3))