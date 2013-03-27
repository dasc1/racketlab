#lang racket

; given b, you will calculate a and c (as solved)

(define (geta b)
  (/ (- 1000000 (* 2000 b)) (- 2000 (* 2 b))))
  
(define (getc a b) (- 1000 (+ a b)))

(define (works b)
  (define a (geta b))
  (if (integer? a)
      (let ([c (getc a b)]) (integer? c))
      #f))

(define limit 499)

(define (findb guess)
  (cond [(> guess limit) #f]
        [(works guess) guess]
        [#t (findb (+ guess 1))]))

(define b (findb 292))
(define a (geta b))
(define c (getc a b))

(list a b c)
(* a b c)