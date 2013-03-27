#lang racket

(require "palindrome.rkt")

(define lonum 99)
(define hinum 999)
  
(define (largest best current)
  (define pal-list (filter palindrome? (map (lambda (x)
                                              (* current x))
                                            (range hinum lonum -1))))
  (cond [(> current hinum) best]
        [(null? pal-list) (largest best (+ current 1))]
        [(> (car pal-list) best) (largest (car pal-list) (+ current 1))]
        [#t (largest best (+ current 1))]))

(largest 0 100)