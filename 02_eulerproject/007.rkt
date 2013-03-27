#lang racket

(require "primes.rkt")

(define (nth-prime x pp)
  (if (= x 1)
      (car pp)
      (nth-prime (- x 1) ((cdr pp)))))

(nth-prime 10001 (primestream-1))