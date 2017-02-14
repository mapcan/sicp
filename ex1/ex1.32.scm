(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (identity x)
  x)
(define (next x)
  (+ x 1))

(accumulate + 0 identity 1 next 10)
(accumulate * 1 identity 1 next 10)
