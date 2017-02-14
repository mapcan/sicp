(define (accumulate combiner null-value term a next b filter?)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (cond ((filter? a) null-value)
                                            (else (term a)))))))
  (iter a null-value))

(define (identity x)
  x)
(define (next x)
  (+ x 1))
(define (filter? x)
  (even? x))

(accumulate + 0 identity 1 next 10 filter?)
(accumulate * 1 identity 1 next 10 filter?)
