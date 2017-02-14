(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (cont-frac n d k)
  (define (next n)
    (+ n 1))
  (define (term x)
    (- (+ k 1) x))
  (define (combiner i prev)
    (let ((di (d i))
          (ni (n i)))
      (/ ni (+ prev di))))
  (accumulate combiner 0 term 1 next k))

(define (tan-cf x k)
  (define (n x)
    (if (<= x 1)
      x
      (* x x)))
  (define (d x)
    (- (* 2 x) 1.0))
  (cont-frac n d k))

(tan-cf 2.0 10)
