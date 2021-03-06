;(define (cont-frac n d k)
;  (define (iter i result)
;    (let ((di (d i))
;          (ni (n i)))
;      (/ result (cond ((> i k) di)
;                      (else (+ di (iter (+ i 1) (/ ni di))))))))
;  (iter 1 (n 1)))

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

  ;(define (iter i result)
  ;  (if (< i 1)
  ;    result
  ;    (iter (dec i) (/ (n (dec i))
  ;                     (+ result (d (dec i)))))))
  ;(iter k (/ (n k) (d k))))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           20)
