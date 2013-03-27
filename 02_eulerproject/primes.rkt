#lang racket

(provide (all-defined-out))

; this need to turn into a function that will GENERATE a primestream
; and create a new plist, c every time it is called.
(define primestream-1 (lambda ()
  (letrec ([plist (list 3 2)]   ; primes list
           [c 2]               ; counter
           [f (lambda ()
                (let* ([q (quotient c 2)]
                       [r (remainder c 2)]
                       [trial (+ -1 (* 2 r) (* 6 q))]
                       [divp (filter
                              (lambda (n)
                              (= (remainder trial n) 0)) plist)])
                  (if (= (length divp) 0)
                      (begin ; found a prime
                        (set! c (+ c 1))
                        (set! plist (cons trial plist))
                        (cons trial f))
                      (begin ; did not find a prime
                        (set! c (+ c 1))
                        (f)))))])
    (cons 2 (lambda () (cons 3 f))))))