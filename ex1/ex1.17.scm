;(define (mul a b)
;  (if (= b 1)
;    a
;    (if (even? b)
;      (mul (double a) (halve b))
;      (+ a (mul a (- b 1))))))
(define (mul a b)
  (define (mul-iter a b acc)
    (cond ((= b 0) acc)
          ((even? b) (mul-iter (double a) (halve b) acc))
          (else (mul-iter a (- b 1) (+ acc a)))))
  (define (double x)
    (+ x x))
  (define (halve x)
    (floor (/ x 2)))
  (mul-iter a b 0))