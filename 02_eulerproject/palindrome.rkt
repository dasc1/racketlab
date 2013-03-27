#lang racket

(provide (all-defined-out))

(define (revnum n)
  (string->number
   (list->string
    (reverse (string->list (number->string n))))))

(define (palindrome? n)
  (= n (revnum n)))