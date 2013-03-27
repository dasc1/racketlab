#lang racket

(define (fact x)
  (if (= x 0) 1 (* x (fact (- x 1)))))

; we are just using this function to calculate the digit factorials
; in the algorithm, we will look them up in a table

(define (cfact c) ; converts a digit character to a factorial num
  (cond [(equal? c #\1) 1]
        [(equal? c #\2) 2]
        [(equal? c #\3) 6]
        [(equal? c #\4) 24]
        [(equal? c #\5) 120]
        [(equal? c #\6) 720]
        [(equal? c #\7) 5040]
        [(equal? c #\8) 40320]
        [(equal? c #\9) 362880]
        [(equal? c #\0) 1]))

(define (curious? n) ; is the number curious?
  (= (apply + (map cfact (string->list (number->string n)))) n))

(define limit 2540160)

(define (tallycurious tally n)
  (cond [(>= n limit) tally]
        [(curious? n) (tallycurious (+ tally n) (+ n 1))]
        [#t (tallycurious tally (+ n 1))]))

(tallycurious 0 3)
  