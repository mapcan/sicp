(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (add-stream (scale-stream integrand dt)
                             int)))
  int)

(define (RC r c t)
  (define rc (currents initial-voltage)
    (add-streams
      (scale-stream currents r)
      (integral (scale-stream currents (/ 1 c))
                initial-voltage
                t)))
  rc)
