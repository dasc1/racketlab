#lang racket

(define a (range 1 101))

(define sumsq (apply + (map (lambda (x) (* x x)) a)))

(define sumr (apply + a))

(- (* sumr sumr) sumsq)