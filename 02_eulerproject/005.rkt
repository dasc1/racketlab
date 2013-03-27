#lang racket

; smallest number evenly divisible by 1 to 20

; first don't worry about 1 to 10, since anything divisible by
; their doubles are also divisible by them.

; Looking at prime factors, there are only 2 needed twice or
; more, 3 needed twice (for 9 or 18) and 2 needed four times
; (for 16)

(define a (* 2 2 2 2 3 3))

; So for 11 to 20, multiply in the primes

(define b (* 11 13 17 19))

; for the composites, extract out the 2s and 3s
; 12 14 15 16 18 20
;  1  7  5  1  1  5

(define c (* 5 7))

; multiply them all together for the answer

(* a b c)