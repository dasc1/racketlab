#lang racket

(define (sum-divisors n)
  (letrec ([q (quotient n 2)]
           [sumfrom (lambda (x tally)
                      (cond [(> x q) tally]
                            [(= (remainder n x) 0) (sumfrom (+ x 1)
                                                            (+ tally x))]
                            [#t (sumfrom (+ x 1) tally)]))])
    (sumfrom 1 0)))

(define (sum-amicable limit)
  (letrec ([sumfrom (lambda (x tally)
                      (cond [(>= x limit) tally]
                            [(and 
                              (= x (sum-divisors (sum-divisors x)))
                              (not (= x (sum-divisors x))))
                             (sumfrom (+ x 1) (+ tally x))]
                            [#t (sumfrom (+ x 1) tally)]))])
    (sumfrom 1 0)))

(sum-amicable 10000)        