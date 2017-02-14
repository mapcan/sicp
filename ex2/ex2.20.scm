(define (same-parity a . n)
  (define (f i)
    (or (and (even? a) (even? i))
        (and (odd? a) (odd? i))))
  (define (iter x result)
    (if (null? x)
      result
      (iter (cdr x) (append result
                            (cond ((f (car x)) (cons (car x) '()))
                                  (else '()))))))
  (iter n '()))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
