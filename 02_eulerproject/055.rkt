#lang racket

(require "palindrome.rkt")

(define (lychrel50? n)
  (letrec ([lych (lambda (iter x)
                   (let ([next (+ x (revnum x))])
                     (cond [(> iter 50) #t]
                           [(palindrome? next) #f]
                           [#t (lych (+ iter 1) next)])))])
    (lych 1 n)))

(define (count-lychrels tally current)
  (cond [(>= current 10000) tally]
        [(lychrel50? current) (count-lychrels (+ tally 1) (+ current 1))]
        [#t (count-lychrels tally (+ current 1))]))

(count-lychrels 0 1)