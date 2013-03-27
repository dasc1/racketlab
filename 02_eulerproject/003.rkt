#lang racket

(require "primes.rkt")

(define (lpf x) ; largest prime factor
  (letrec ([aux (lambda (num pp)
                  (cond [(> (car pp) (sqrt num)) num] ; no more prime facs
                        [(= (remainder num (car pp)) 0)
                         (aux (quotient num (car pp)) pp)]
                        [#t (aux num ((cdr pp)))]))])
    (aux x (primestream-1))))

(lpf 600851475143)