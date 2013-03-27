#lang racket

; First we must create a huge reference list of primes that we might
; need to look up.  Since a and b are bounded by 1000, and n is also
; bounded by 1000 (if n matches b, the result is divisible by b) we
; know the max value of n^2 + an + b must be 2001000.  So let's
; create a list of all primes up to that number

(define limit 2001000)

(define twomil (list->vector (range limit)))

(define (elimmults start amt)
  (if (>= start limit) #t
      (begin (vector-set! twomil start 0) (elimmults (+ start amt) amt))))

(define (primelist lst current)
  (cond [(>= current limit) (reverse lst)] ; found all the primes
        [(= 0 (vector-ref twomil current)) ; mult. of lower num - skip it
         (primelist lst (+ current 2))]
        [#t (begin (elimmults (* 2 current) current)
                   (primelist (cons current lst) (+ current 2)))]))

(define prime2mil (primelist '(2) 3))

; next step, we consider all combinations of a and b, and try
; successive values of n for each one, testing for primes.  We
; keep track of the length of the longest chain of primes, and the
; values of a and b that led to that length.

(define (inz v lst)
  (cond [(null? lst) #f]
        [(> v (car lst)) (inz v (cdr lst))]
        [#t (= v (car lst))]))

(define (prime x)
  (inz x prime2mil))

; create a lookup list for squares
(define squares
  (map (λ (x) (* x x)) (range 0 400)))
  
(define (findlong limit) ; assume limit is an odd number
  (define (top a b an n nsq best)
    (if (prime (+ (car nsq) an b))
        (top a b (+ an a) (+ n 1) (cdr nsq) best)
        (let ([newbest (if (> n (car best))
                           (list n a b)
                           best)])
          (cond [(>= b limit) best]
                [(>= a limit) 
                 (top (- limit) (+ b 2) 0 0 squares newbest)]
                [#t (top (+ a 2) b 0 0 squares newbest)]))))
  (top (- limit) 3 0 0 squares (list 0 0 0)))

(define bestpair (findlong 999))
bestpair
(* (cadr bestpair) (caddr bestpair))