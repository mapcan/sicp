(define (f-recursive n)
  (if (< n 3)
    n
    (+ (f-recursive (- n 1))
       (* (f-recursive (- n 2)) 2)
       (* (f-recursive (- n 3)) 3))))

(define (f n) 
  (if (< n 3)
    n
    (f-iter 0 1 2 3 n)))
(define (f-iter f1 f2 f3 counter n)
  (if (> counter n)
    f3
    (f-iter f2
            f3
            (+ f3 (* 2 f2) (* 3 f1))
            (+ counter 1)
            n)))
