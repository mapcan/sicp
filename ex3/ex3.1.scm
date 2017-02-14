(define (make-accumulator sum)
  (define (accumulate amount)
    (begin (set! sum (+ sum amount))
           sum))
  accumulate)

(define A (make-accumulator 5))
(A 10)
(A 10)
