(define (make-unbound! var env)
  (let ((frame (first-frame env)))
    (define (scan vars vals)
      (cond ((null? vars) 'ok)
            ((eq? var (car vars))
             (set-
